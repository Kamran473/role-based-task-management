import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Task {
  String title = '';
  String description = '';
  String id = '';
  Task({required this.title, required this.description, required this.id});
}

class TaskService {
  final CollectionReference tasksCollection =
      FirebaseFirestore.instance.collection('tasks');

/*   Future<List<Task>> getTasks() async {
    QuerySnapshot querySnapshot = await tasksCollection.get();

    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Task(
        title: data['title'] ?? '',
        description: data['description'] ?? '',
      );
    }).toList();
  } */
}

String selectedRole = 'Create';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList({super.key, required this.tasks});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  void _deleteTask(Task task) {
    // Implement the delete task logic here
    // Remove the task from the local list and Firestore
    widget.tasks.remove(task);
    setState(() {});

    // Delete the task from Firestore
    FirebaseFirestore.instance.collection('data').doc(task.id).delete();
  }

  void _showUpdateDialog(Task task) {
    TextEditingController titleController =
        TextEditingController(text: task.title);
    TextEditingController descriptionController =
        TextEditingController(text: task.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Update task and Firestore
                task.title = titleController.text;
                task.description = descriptionController.text;
                _updateTask(task);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasksPage()),
                );
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _updateTask(Task task) {
    // Update task in the local list
    setState(() {});

    // Update task in Firestore
    FirebaseFirestore.instance.collection('data').doc(task.id).update({
      'title': task.title,
      'description': task.description,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        Task task = widget.tasks[index];
        return Container(
          /*  decoration: BoxDecoration(
            borderRadius: 
          ), */
          child: ListTile(
            trailing: PopupMenuButton(
              onSelected: (value) {
                if (value == 'update') {
                  // Handle update action
                  _showUpdateDialog(task);
                } else if (value == 'delete') {
                  // Handle delete action
                  _deleteTask(task);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'update',
                  child: Text('Update'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ),
            title: Text(task.title),
            subtitle: Text(task.description),
          ),
        );
      },
    );
  }
}

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> tasks = [];
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  int doc = 0;
  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    TaskService taskService = TaskService();
    List<Task> fetchedTasks = [];
    var db = FirebaseFirestore.instance;
    var data = await db.collection("data").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          fetchedTasks.add(Task(
              title: docSnapshot.data()["title"],
              description: docSnapshot.data()["description"],
              id: docSnapshot.id));
          doc++;
          print(fetchedTasks);
          //print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    setState(() {
      tasks = fetchedTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: Text('Task List'),
      ), */
      body: tasks != []
          ? Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: _title,
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    iconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.01,
                      ),
                      /*  borderSide: BorderSide(
                          color: Colors.transparent,
                        ), */
                    ),
                    hintText: "Title",
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: _description,
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    iconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.01,
                      ),
                      /* borderSide: BorderSide(
                          color: Colors.transparent,
                        ), */
                    ),
                    hintText: "Description",
                  ),
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var db = FirebaseFirestore.instance;
                    final data = <String, String>{
                      "title": _title.text,
                      "description": _description.text,
                    };
                    tasks.add(Task(
                        title: _title.text,
                        description: _description.text,
                        id: '$doc'));
                    setState(() {});
                    db
                        .collection("data")
                        .doc(doc.toString())
                        .set(data)
                        .onError((e, _) => print("Error writing document: $e"));
                    doc++;
                  },
                  onLongPress: () {},
                  onFocusChange: (value) {},
                  onHover: (value) {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.25,
                        MediaQuery.of(context).size.height * 0.05),
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.height * 0.05)),
                    ),
                  ),
                  child: const Text('Add'),
                ),
                TasksList(tasks: tasks),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

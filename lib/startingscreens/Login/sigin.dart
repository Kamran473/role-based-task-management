import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/mainscreen/admin.dart';
import 'package:task_management/startingscreens/Login/authentication.dart';
import 'package:task_management/startingscreens/Login/register.dart';
import 'package:task_management/startingscreens/forgetpass/entermail.dart';

class signin extends StatefulWidget {
  const signin({
    super.key,
  });

  @override
  State<signin> createState() => _MyHomePageState();
}

bool obsecure = true;
bool isChecked = false;
String selectedRole = 'User';

class _MyHomePageState extends State<signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var select = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/login111.png',
                    ),
                    fit: BoxFit.cover),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  children: [
                    /// first container
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: Container(
                        decoration: BoxDecoration(),
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: Column(
                            children: [
                              Column(children: [
                                Text.rich(
                                  textAlign: TextAlign.justify,
                                  TextSpan(
                                    text: 'Welcome\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.045,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'By signing in you are agreeing to\n',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(94, 94, 94, 1),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.016,
                                              fontWeight: FontWeight.bold)),
                                      // can add more TextSpans here...
                                      TextSpan(
                                          text: 'our ',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(94, 94, 94, 1),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.016,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'terms and policy',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.016,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {})
                                    ],
                                  ),
                                ),
                              ]),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              )),
                              TextFormField(
                                controller: _emailController,
                                autofocus: true,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    iconColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Email Address",
                                    suffixIcon: Icon(Icons.mail)),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter some text";
                                  }

                                  if (!value.contains("@")) {
                                    return "Please enter correct format of email";
                                  }
                                  return null;
                                }),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                              )),
                              TextFormField(
                                  controller: _passwordController,
                                  autofocus: true,
                                  obscureText: obsecure,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    iconColor: Colors.grey,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            0.01,
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        obsecure = !obsecure;
                                        setState(() {});
                                      },
                                      child: Icon(obsecure
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                    hintText: "Password",
                                  ),
                                  validator: ((value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password";
                                    }

                                    if (value.length < 8 || value.length > 20) {
                                      return "Length of password should be atleast 8 characters long";
                                    }
                                    return null;
                                  })),
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.08,
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.044,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedRole,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedRole = newValue!;
                                        if (selectedRole == 'Admin') {
                                          select = '1';
                                        } else if (selectedRole == 'User') {
                                          select = '2';
                                        } else if (selectedRole == 'Manager') {
                                          select = '3';
                                        }
                                      });
                                    },
                                    items: <String>['Admin', 'Manager', 'User']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //sizedbox(height:90),
                    // second container
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.2,
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    AuthenticationHelper()
                                        .logIn(
                                            email: _emailController.text,
                                            password: _passwordController.text)
                                        .then((value) {
                                      if (value == null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => register()),
                                        );
                                      }
                                    });
                                    if (select == '1') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TasksPage()),
                                      );
                                    }
                                  }
                                },
                                onLongPress: () {},
                                onFocusChange: (value) {},
                                onHover: (value) {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.25,
                                      MediaQuery.of(context).size.height *
                                          0.05),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.height *
                                                0.05)),
                                  ),
                                ),
                                child: const Text('Login'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => register()),
                                  );
                                },
                                onLongPress: () {},
                                onFocusChange: (value) {},
                                onHover: (value) {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.25,
                                      MediaQuery.of(context).size.height *
                                          0.05),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.height *
                                                0.05)),
                                  ),
                                ),
                                child: const Text('Register'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01),
                            child: Row(
                              children: [
                                Text(
                                  "Dont remember your password? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                ),
                                TextButton(
                                  child: Text("Click here",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgetPass1()),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

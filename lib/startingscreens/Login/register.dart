// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_management/startingscreens/Login/authentication.dart';
import 'package:task_management/startingscreens/Login/sigin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: register(),
    );
  }
}

class register extends StatefulWidget {
  const register({super.key});
  @override
  State<register> createState() => _register();
}

bool obsecure = true;
bool isChecked = false;
String selectedRole = 'User';

class _register extends State<register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _username = TextEditingController();

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
                      'images/signup11.png',
                    ),
                    fit: BoxFit.cover),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.055),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: MediaQuery.of(context).size.height * 0.04,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signin()),
                          );
                        },
                      ),
                    ),
                    Column(children: [
                      /// first container
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Container(
                          decoration: BoxDecoration(),
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Column(
                              children: [
                                Column(children: [
                                  Text('Sign Up\n',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                      )),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Create your account\n',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(94, 94, 94, 1),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.016,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  // can add more TextSpans here...
                                ]),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.003,
                                )),
                                TextFormField(
                                  controller: _username,
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
                                        borderSide: new BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      hintText: "User Name",
                                      suffixIcon: Icon(Icons.person)),
                                  validator: ((value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter user name";
                                    }
                                    return null;
                                  }),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.007,
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
                                        borderSide: new BorderSide(
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
                                  vertical: MediaQuery.of(context).size.height *
                                      0.007,
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
                                        borderSide: new BorderSide(
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

                                      if (value.length < 8 ||
                                          value.length > 20) {
                                        return "Length of password should be atleast 8 characters long";
                                      }
                                      return null;
                                    })),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.007,
                                )),
                                TextFormField(
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
                                        borderSide: new BorderSide(
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
                                      hintText: "Confirm Password",
                                    ),
                                    validator: ((value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your password";
                                      }

                                      if (value.length < 8 ||
                                          value.length > 20) {
                                        return "Length of password should be atleast 8 characters long";
                                      }
                                      return null;
                                    })),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                            });
                          },
                          items: <String>['Admin', 'Manager', 'User']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // second container
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.17,
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              AuthenticationHelper().signUp(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  role: selectedRole,
                                  username: _username.text);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signin()),
                            );
                          },
                          onLongPress: () {},
                          onFocusChange: (value) {},
                          onHover: (value) {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.25,
                                MediaQuery.of(context).size.height * 0.05),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.05),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  MediaQuery.of(context).size.height * 0.05)),
                            ),
                          ),
                          child: const Text('Register'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ]),
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

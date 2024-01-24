// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../Login/sigin.dart';

class forgetpass3 extends StatefulWidget {
  const forgetpass3({super.key});
  @override
  State<forgetpass3> createState() => _register();
}

bool obsecure = true;
bool isChecked = false;

class _register extends State<forgetpass3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.055),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Column(children: [
                  /// first container
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: Container(
                      decoration: BoxDecoration(),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.007,
                            )),
                            TextFormField(
                              autofocus: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  iconColor: Colors.grey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height * 0.01,
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
                              vertical:
                                  MediaQuery.of(context).size.height * 0.007,
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
                                      MediaQuery.of(context).size.height * 0.01,
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
                                  hintText: "New Password",
                                ),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your new password";
                                  }

                                  if (value.length < 8 || value.length > 20) {
                                    return "Length of password should be atleast 8 characters long";
                                  }
                                  return null;
                                })),
                            Padding(
                                padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.007,
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
                                      MediaQuery.of(context).size.height * 0.01,
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
                                  hintText: "Confirm your new Password",
                                ),
                                validator: ((value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your new password";
                                  }

                                  if (value.length < 8 || value.length > 20) {
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
                  //sizedbox(height:90),
                  // second container
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: MediaQuery.of(context).size.width * 0.11,
                      right: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signin()),
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
                                        MediaQuery.of(context).size.height *
                                            0.05),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.height *
                                              0.05)),
                                ),
                              ),
                              child: const Text('Confirm'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ])
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

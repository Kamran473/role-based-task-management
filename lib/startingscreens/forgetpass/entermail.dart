import 'package:flutter/material.dart';

import '../Login/sigin.dart';
import 'entercode.dart';

class ForgetPass1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

// ignore: must_be_immutable
class MyScreen extends StatelessWidget {
  TextEditingController userInputController = TextEditingController();

  MyScreen({super.key}); // Controller to capture user input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.1455439329147339, 0.13629785180091858),
            end: Alignment(0.702239453792572, 0.15669594705104828),
            colors: [
              Color.fromRGBO(149, 202, 242, 1),
              Color.fromRGBO(99, 182, 255, 1),
            ],
          ),
        ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signin()),
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Text(
                    'Enter Email / Phone Number for Confirmation code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.05,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  child: TextField(
                    controller: userInputController, // Connect the controller
                    decoration: InputDecoration(
                      hintText: 'Please enter email / phone number',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    final userInput =
                        userInputController.text; // Get user's input
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => forgetpass(
                          phoneNumber: userInput,
                        ), // Pass the user's input
                      ),
                    );
                  },
                  child: Text(
                    'Next ->',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

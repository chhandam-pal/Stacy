import 'package:app3/reusable/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app3/HomeScreen.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailIdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/pexels.jpg"),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text("SignUp",
          style: TextStyle(color: Colors.white54),),
          backgroundColor: Colors.black,

        ),
          body: Container(height: MediaQuery
              .of(context)
              .size
              .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [
            //       Colors.grey, Colors.blueGrey, Colors.white,
            //     ])

            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,100 ,10, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    textField("Enter UserName", Icons.person, false, _userNameController),
                    SizedBox(
                      height: 30,
                    ),
                    textField("Enter emailId", Icons.email_outlined, false, _emailIdController),
                    SizedBox(
                      height: 30,
                    ),
                    textField("Enter Password", Icons.lock, true, _passwordController),
                    SizedBox(
                      height: 30,
                    ),
                    signedInUpButton(context, false, () {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailIdController.text,
                        password: _passwordController.text
                        ).then((value)  {
                          print("Created New Account");
                          Navigator.push(context, MaterialPageRoute(builder:
                         (context) => MyHomePage()));
                        }).onError((error, stackTrace) {
                          print("${error.toString()}");
                      });

                    }),


                  ],
                ),
              ),

            ),
          )
      ),
    );
  }
}

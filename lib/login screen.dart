

import 'package:app3/HomeScreen.dart';
import 'package:app3/reusable/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'package:app3/signUpScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Stacy", style: GoogleFonts.caveat(
            color: Colors.white, fontSize: 50,
          ),),
          backgroundColor: Colors.black,

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,



          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.05, 20, 0),
            child: Column(
              children: <Widget> [
                ( logoWidget("assets/images/—Pngtree—white movie icon_4618956.png")),
                SizedBox(
                  height: 30,
                ),
                  textField("Enter-email-Id" ,Icons.person, false, _emailEditingController),

                SizedBox(
                  height: 30,
                ),
                textField("Enter-Password", Icons.lock, true, _passwordEditingController),
                SizedBox(
                  height: 10,
                  //height: 10,
                ),
                signedInUpButton(context, true, ()  {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailEditingController.text,
                      password: _passwordEditingController.text).then((value) {

                        Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()))
                        ;
                        Fluttertoast.showToast(
                            msg: "Succesfully Logged In",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black26,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );}).onError((error, stackTrace) {
                    Fluttertoast.showToast(
                        msg: "Incorrect Credentials",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black26,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  });
                }),
                signUpOption(),

              ],
            ),
            ),

          ),
        ),
      ),
    );
  }
}

Row signUpOption(){
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont Have an Account?",
          style: TextStyle(color: Colors.grey),),
        Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => signUpScreen()));
              },
              child: const Text(
                " Sign Up",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),

            );
          }
        )

      ],
  );
}
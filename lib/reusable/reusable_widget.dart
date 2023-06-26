

import 'package:app3/controller/simple_ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:app3/signUpScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';


Image logoWidget(String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    height: 200,
    width: 200,
    color: Colors.white54,
  );
}
TextField textField(String text, IconData icon, bool isPassType,TextEditingController controller ){
  return TextField(
    controller: controller,
    obscureText: isPassType,
    enableSuggestions: !isPassType,
    autocorrect: !isPassType,
    cursorColor: Colors.white,
    style: GoogleFonts.robotoCondensed(
      color: Colors.white70,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.blueGrey,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white54.withOpacity(0.8),),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),

      )

    ),
    keyboardType: isPassType ? TextInputType.visiblePassword : TextInputType.emailAddress,



  );
}

Container signedInUpButton(BuildContext context,bool isLogin, Function tap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: ElevatedButton(
      onPressed: () {
        tap();
      },
      child: Text(
        isLogin ? "Log-In" : "Sign-Up",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white54,
        ),

      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.grey;
  }
          return Colors.black45;

  },

      ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30)),
  )
    ),


    )
  );

}
Widget displayBar(SimpleUiController simpleUiController,List trending){

  return ListView.builder(

      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal, itemBuilder: ((context,index){

    return Obx(
      () => GestureDetector(
        onTap: (){
          simpleUiController.selectedIndex.value = index;
        },
        child: AnimatedContainer(
          margin: EdgeInsets.fromLTRB(index==0 ? 15: 5, 10, 5, 10),
          decoration: BoxDecoration(
            color: index == simpleUiController.selectedIndex.value? Colors.grey[700] : Colors.grey[200],
            borderRadius: BorderRadius.circular(index == simpleUiController.selectedIndex.value?18:15),
          ),
          width: 100,

          duration: Duration(milliseconds: 300),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage(
                   'http://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
                 )
               )
                ),
              )
            ],
          ),
        ),
      ),
    );
  })
  );
}

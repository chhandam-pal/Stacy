import 'package:app3/controller/simple_ui_controller.dart';
import 'package:app3/login%20screen.dart';
import 'package:app3/reusable/text.dart';
import 'package:app3/toprated.dart';
import 'package:app3/tv.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'firebase_options.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:app3/reusable/reusable_widget.dart';
import 'package:get/get.dart';
import 'package:app3/trending.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app3/signUpScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'ad86223d09a1c832a1d6c2f9fca14a90';
  final String readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZDg2MjIzZDA5YTFjODMyYTFkNmMyZjlmY2ExNGE5MCIsInN1YiI6IjYzYjkwZGNkZmE0MDQ2MDBlNjM5ZmQyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A5OpTywyXLq2qyq0M6urBIMkBigLAkeSDMoeEPQU-o0';

  @override
  void initState(){
    loadmovies();
    super.initState();

  }

  loadmovies() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey,readaccesstoken ), logConfig: ConfigLogger(
        showLogs: true,
      showErrorLogs: true,
    ));
    Map trendingresults  = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults  = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();


    setState(() {
      trendingmovies = trendingresults['results'];
      topratedmovies = topratedresults['results'];
      tv = tvresults['results'];
    });
    print(trendingmovies);
  }

  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: modified_text(text: "Welcome", color: Colors.white38, size: 26),
        actions: <Widget>[
         Theme(
           data: Theme.of(context).copyWith(
             cardColor: Colors.grey,
           ),
           child: PopupMenuButton(icon:Icon(Icons.person,color: Colors.white38,),itemBuilder: (context)=>[
                     PopupMenuItem(child: Column(


                           children :[
                             Text("Hello!!!",style: GoogleFonts.kanit(
                                fontSize: 20,
                             ),textAlign: TextAlign.center,),

                             TextButton(onPressed: (){
                               Fluttertoast.showToast(
                                   msg: "Created by Chhandam Pal",
                                   toastLength: Toast.LENGTH_LONG,
                                   gravity: ToastGravity.CENTER,
                                   timeInSecForIosWeb: 3,
                                   backgroundColor: Colors.black,
                                   textColor: Colors.white,
                                   fontSize: 20.0
                               );
                             }, child: Text("About", style: GoogleFonts.kanit(
                               color: Colors.white,
                             ),)),
                             Container(


                               child: TextButton(child:Text("Logout",style: TextStyle(
                                 color: Colors.white,
                               ), ), onPressed: (){
                                 FirebaseAuth.instance.signOut();
                                 Navigator.push(context, MaterialPageRoute(builder: (context)
                                 =>LoginScreen()));
                                 Fluttertoast.showToast(
                                     msg: "Successfully Logged Out",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.black26,
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                 );
                               }),
                             ),

                           ]




                    )),
              ]),
         )
             ]

         ),



      body: ListView(
        children: [
          TopRatedMovies(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies,),
          TV(tv: tv),
      ],

    ),
    );
  }
}




/*Widget loading(){
  return Scaffold(
      body: Center(
      child: LoadingAnimationWidget.staggeredDotWave(
      color: Colors.white,
      size: 200,
  ),
  ),
}*/

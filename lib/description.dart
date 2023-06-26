import 'package:flutter/material.dart';
import 'package:app3/reusable/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(text: '⭐ Average Rating - ' + vote, color: Colors.white,size: 24,)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Not Loaded',color: Colors.white38, size: 24)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
              modified_text(text: 'Releasing On - ' + launch_on,color: Colors.white38, size: 14)),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: modified_text(text: description, color: Colors.white38,size: 18)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
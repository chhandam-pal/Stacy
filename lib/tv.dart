import 'package:app3/reusable/text.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:app3/reusable/text.dart';
import 'package:app3/description.dart';

class TV extends StatelessWidget {

  final List tv;

  const TV({super.key, required this.tv});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Popular Tv Shows", size: 26,color: Colors.white54),

          SizedBox(height: 20,),

          Container(height: 270,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Description(name: tv[index]['original_name'].toString(),
                        description:  tv[index]['overview'].toString(),
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+ tv[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+ tv[index]['poster_path'],
                        vote:  tv[index]['vote_average'].toString(),
                        launch_on:  "NotAvailable",)));

                    },
                    child:
                    tv[index]['original_name']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(29)),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    spreadRadius: 4,

                                  )
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+ tv[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          Container(
                            child: modified_text(text:
                            tv[index]['original_name']!=null? tv[index]['original_name'] : 'Loading',
                              size: 20, color: Colors.white38,),
                          )
                        ],
                      ),
                    ):Container(),
                  );
                }),)
        ],
      ),
    );
  }
}

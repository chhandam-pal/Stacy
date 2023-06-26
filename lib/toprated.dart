import 'package:app3/reusable/text.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:app3/reusable/text.dart';

import 'description.dart';

class TopRatedMovies extends StatelessWidget {

  final List toprated;

  const TopRatedMovies({super.key, required this.toprated});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Top Rated Movies", size: 26,color: Colors.white54),

          SizedBox(height: 20,),

          Container(height: 270,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Description(name: toprated[index]['title'],
                        description:  toprated[index]['overview'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path'],
                        vote:  toprated[index]['vote_average'].toString(),
                        launch_on:  toprated[index]['release_date'],)));

                    },
                    child: Container(
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
                                        'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path']
                                    )
                                )
                            ),
                          ),
                          Container(
                            child: modified_text(text:
                            toprated[index]['title']!=null? toprated[index]['title'] : 'Loading',
                              size: 20, color: Colors.white38,),
                          )
                        ],
                      ),
                    ),
                  );
                }),)
        ],
      ),
    );
  }
}

import 'package:app3/description.dart';
import 'package:app3/reusable/text.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:app3/reusable/text.dart';

class TrendingMovies extends StatelessWidget {

  final List trending;

  const TrendingMovies({super.key, required this.trending});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Trending Movies", size: 26,color: Colors.white54),

          SizedBox(height: 20,),

          Container(height: 270,
          child: ListView.builder(itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Description(name: trending[index]['title'],
                    description:  trending[index]['overview'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['backdrop_path'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path'],
                    vote:  trending[index]['vote_average'].toString(),
                    launch_on:  trending[index]['release_date'],)));
                },
                child:
                trending[index]['title']!=null?Container(
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
                              blurRadius: 4,
                              spreadRadius: 2,

                            )
                          ],
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path']
                            )
                          )
                        ),
                      ),
                      Container(
                        child: modified_text(text:
                        trending[index]['title']!=null? trending[index]['title'] : 'Loading',
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

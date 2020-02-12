import 'package:flutter/material.dart';
import 'package:youtubeclone_app/Api.dart';
import 'package:youtubeclone_app/Home.dart';
import 'package:youtubeclone_app/model/Video.dart';

class HomeScreen extends StatefulWidget {

  String search;
  Home(this.search);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _listvideos(String search){

    Api api = Api();


    return api.search(search);
  }

  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Video>>(
      future: _listvideos(widget.search),
      builder: (context, snapshot){

        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){

              return ListView.separated(
                  itemBuilder: (context, index){

                    List<Video> video = snapshot.data;
                    Video video = videos[index];


                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.image)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.description),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length
              )

            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            break;
        }return
      },
    );
  }
}

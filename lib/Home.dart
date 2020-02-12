import 'package:flutter/material.dart';
import 'package:youtubeclone_app/CustomSearchDelegate.dart';
import 'package:youtubeclone_app/screens/Library.dart';
import 'package:youtubeclone_app/screens/Hot.dart';
import 'package:youtubeclone_app/screens/HomeScreen.dart';
import 'package:youtubeclone_app/screens/Inscription.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _actualIndex = 0;
  String _result = "";


  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(_result),
      Hot(),
      Inscription(),
      Library()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "image/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async{
              String res = await showSearch(context: null, delegate: CustomSearchDelegate());
              setState(() {
                _result = res;
              });
            },
          ),

          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("action: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("action: account");
            },
          )
          */

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_actualIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _actualIndex,
          onTap: (index){
            setState(() {
              _actualIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
                title: Text("Home"),
                icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.red,
                title: Text("Hot"),
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
                title: Text("Inscription"),
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.green,
                title: Text("Library"),
                icon: Icon(Icons.folder)
            ),
          ]
      ),
    );
  }
}

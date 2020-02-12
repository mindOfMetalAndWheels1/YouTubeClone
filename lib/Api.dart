import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtubeclone_app/model/Video.dart';

const YOUTUBE_KEY_API = "AIzaSyCb6-whkdc0wabT20GNOu7Ps0o1Ydqhzig";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future <List<Video>> search(String search) async{

    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$YOUTUBE_KEY_API"
          "&q=$search"
    );

    if( response.statusCode == 200){

      Map<String, dynamic> jsonData = json.decode(response.body);

      List<Video> videos = jsonData["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;
      //print("result: " + jsonData["items"][0]["snippet"]["title"].toString());


    }else{

    }
  }
}
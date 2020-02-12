import 'package:flutter/material.dart';

class Video{

  String id;
  String title;
  String image;
  String description;
  String channel;

  Video({this.id, this.title, this.image, this.description, this.channel});


  /*static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"],
    );
  }*/

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
        id: json["id"]["videoId"],
        title: json["snippet"]["title"],
        description: json["snippet"]["description"],
        image: json["snippet"]["thumbnails"]["high"]["url"],
        channel: json["snippet"]["channelTitle"],
    );
  }



}
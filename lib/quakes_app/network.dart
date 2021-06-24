import 'dart:convert';

import 'package:earthquake/quakes_app/Quake.dart';
import 'package:http/http.dart';

class Network{
  Future <Quake> getAllQuakes() async{

    var apiurl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson";
    final response = await get(Uri.encodeFull(apiurl));

    if(response.statusCode == 200){

      print(" QUAKES data : ${response.body}");
      return Quake.fromJson(json.decode(response.body));
    }else{
      throw Exception("error getting quakes");

    }

  }



}
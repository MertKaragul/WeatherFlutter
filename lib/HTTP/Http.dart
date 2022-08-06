import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weatherflutter/Model/WeatherModel.dart';
import 'package:weatherflutter/Util/Util.dart';

Future<void> getWeathers(double latitude , double longitude) async{
  var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${API_KEY}&lang=tr");
  var response = await http.get(url);
  if(response.statusCode == 200){
    var jsonResponse = convert.jsonDecode(response.body) as Map<String , dynamic>;
    return Future.value(WeatherModel.fromJson(jsonResponse));
  }else{
    return Future.error(response.statusCode);


  }
}
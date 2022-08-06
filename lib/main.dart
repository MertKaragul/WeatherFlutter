import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherflutter/Location/Location.dart';
import 'package:weatherflutter/Util/Util.dart';

import 'View/Error.dart';
import 'View/Weather.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    home: Scaffold(
      backgroundColor: Color(0xffFACE3D),
      body: const WeatherHome(),
    ),
  ));
}

class WeatherHome extends StatefulWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final Location location = new Location();

  @override
  Widget build(BuildContext context) {
    return SafeArea( child: Column(
      children: [
        FutureBuilder(
            future: location.checkPermission(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                var error = snapshot.error;
                return AppError(errMessage: error.toString(),);
              }else if(!snapshot.hasError){
                return Weather();
              }else{
                return CircularProgressIndicator();
              }
        }),
      ],
    ));
  }
}

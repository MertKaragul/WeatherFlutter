import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherflutter/Location/Location.dart';
import 'package:weatherflutter/Model/WeatherModel.dart';

import '../HTTP/Http.dart';
import '../Util/Util.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final Location location = new Location();
  late Stream<Position> _streamLoc;
  late Position _position;
  @override
  Widget build(BuildContext context) {
    _streamLoc = Geolocator.getPositionStream(locationSettings: location.locationSetting);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StreamBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _position = snapshot.data as Position;
                      return Column(
                        children: [
                          FutureBuilder(
                            future: getWeathers(_position.latitude , _position.longitude),
                            builder: (context, snapshot) {
                              print(snapshot.data);
                              if (snapshot.hasData) {
                                var data = snapshot.data as WeatherModel;
                                if(data != null) _streamLoc.listen((event) {}).cancel();
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        normalText(
                                            (data.name != null &&
                                                    data.name != "")
                                                ? data.name!
                                                : "distcrict",
                                            ((width) * 0.05)),
                                        Spacer(),
                                        normalText(
                                            (data.weather[0].main != null &&
                                                    data.weather[0].main != "")
                                                ? data.weather[0].main!
                                                : "weather_status",
                                            ((width) * 0.05)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        normalText("${data.sys.country}",
                                            ((width) * 0.05)),
                                        Spacer(),
                                        normalText(formatDate, ((width) * 0.05)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.network(
                                          fit: BoxFit.cover,
                                          "http://openweathermap.org/img/wn/${data.weather[0].icon}.png",
                                          height: (height * 0.70),
                                          width: (width * 1.5),
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            normalText("${data.wind.speed}", ((width) * 0.05)),
                                            RotationTransition(
                                              turns: AlwaysStoppedAnimation(data.wind.deg != null ? (data.wind.deg! / 360) : (0 / 360)),
                                              child: Icon(
                                                Icons.arrow_upward,
                                                color: Colors.white,
                                                size: (width + height) * 0.03,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text("${_position.latitude} ${_position.longitude}")
                                      ],
                                    )
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  stream: _streamLoc),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _streamLoc.listen((event) {}).cancel();
    super.dispose();
  }
}

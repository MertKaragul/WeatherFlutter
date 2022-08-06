import 'dart:async';
import 'package:geolocator/geolocator.dart';

class Location{
  final LocationSettings locationSetting = LocationSettings(
    accuracy: LocationAccuracy.medium,
    distanceFilter: 100,
  );

  Future<void> checkPermission() async{


    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
       return Future.error("Location services are disabled");
    }

    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location Permission are denied');
      }
    }else{
      permission = await Geolocator.requestPermission();
    }

    if(permission == LocationPermission.deniedForever){
      return Future.error("Location Permissions are permanently denied , we cannot request permission");
    }
    return await Future.value("no error");
  }

  LocationSettings locationSettings(){
    return locationSetting;
  }

  Future<void> getLocations(){
    return Future.value(Geolocator.getCurrentPosition());
  }


}
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mainpage/Modles/ContriesName.dart';
import 'package:mainpage/Tools/DetectCityName.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  var Textscolor = Colors.white;
  bool itsMoring = false;
  var timeRn = DateTime.now();
  List<dynamic> worldZonesApi = [];
  int locationSelectedIndex = 0;
  String city = "";
  var contryChossed = ContryChossed(
      "MA", "Morocco", "Casablanca", "Africa/Casablanca", 3600, 1658416860);
// this fonction get called immidiatly after the app get lunched
  void timeZone() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      tz.Location detroit = tz.getLocation(contryChossed.zoneName);
      timeRn = tz.TZDateTime.now(detroit);
      compaireDates(detroit);
      notifyListeners();
    });
  }
  void compaireDates(tz.Location location)
  {
    DateTime moriningStart = DateTime.parse("${DateFormat("yyyy-MM-dd").format(tz.TZDateTime.now(location))} 08:00:00");
    DateTime moriningEnd = DateTime.parse("${DateFormat("yyyy-MM-dd").format(tz.TZDateTime.now(location))} 20:00:00");
    DateTime timeRightNow = DateTime.parse("${DateFormat("yyyy-MM-dd KK:mm:ss").format(tz.TZDateTime.now(location))}");
    if(timeRightNow.compareTo(moriningStart) == 1 && timeRn.compareTo(moriningEnd) == -1)
    {
      itsMoring = true;
      Textscolor = Colors.black;
    }
    else
    {
      itsMoring = false;
      Textscolor = Colors.white;
    }
  }

  void ChangeTimeZone(String zoneName) async {
    var scaffuld = await get(Uri.parse(
        "http://api.timezonedb.com/v2.1/list-time-zone?key=9ZGAE5QIMRVS&format=json"));
    Map<dynamic, dynamic> respende = jsonDecode(scaffuld.body);
    worldZonesApi = respende["zones"].toList();
    for (int i = 0; i < worldZonesApi.length; i++) {
      if (worldZonesApi.elementAt(i)["zoneName"] == zoneName) {
        city = DetectCityName(zoneName);
        contryChossed = ContryChossed(
            worldZonesApi.elementAt(i)["countryCode"], worldZonesApi.elementAt(i)["countryName"],
            city, worldZonesApi.elementAt(i)["zoneName"], worldZonesApi.elementAt(i)["gmtOffset"],
            worldZonesApi.elementAt(i)["timestamp"]);
        notifyListeners();
        return;
      }
    }
  }
}

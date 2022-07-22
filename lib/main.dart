import 'package:mainpage/Location.dart';
import 'package:mainpage/TimeZoneListView.dart';
import 'package:mainpage/clock.dart';
import 'package:mainpage/conainter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/ProviderData.dart';

void main() {
  tz.initializeTimeZones();
  runApp(ChangeNotifierProvider(create: (_) => GameProvider(),
      child: MaterialApp(home: Clock())));
}

class Clock extends StatelessWidget {
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    context.read<GameProvider>().ChangeTimeZone("Africa/Casablanca");
    context.read<GameProvider>().timeZone();
    return Scaffold(
      body: conainter(Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(height: mediaQuery.size.height * 0.1),
            TextButton(
                onPressed: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TimeZoneListView())),

                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.location_on),Text("Choose Location",style: TextStyle(fontSize: mediaQuery.size.height * 0.04),)],)),
            SizedBox(height: mediaQuery.size.height * 0.06),
            LocationText(),
            SizedBox(height: mediaQuery.size.height * 0.15),
              ClockTime()
          ],
    ),
      ),
      );
  }
}

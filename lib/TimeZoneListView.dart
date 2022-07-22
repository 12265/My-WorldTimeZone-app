import 'package:flutter/material.dart';
import 'package:mainpage/Provider/ProviderData.dart';
import 'package:mainpage/Tools/DetectCityName.dart';
import 'package:provider/provider.dart';

class TimeZoneListView extends StatelessWidget {
  const TimeZoneListView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appbar = AppBar(title: Center(child: Text("Select a Zone")));
    return MaterialApp(
        home: Scaffold(
            appBar: appbar,
            body: ListView.builder(
                itemBuilder: (ctx, index) {
                  final zoneName = context
                      .watch<GameProvider>()
                      .worldZonesApi
                      .elementAt(index)["zoneName"];
                  final cityName = DetectCityName(zoneName);
                  return Container(
                      width: double.infinity,
                      height: (mediaQuery.size.height -
                              appbar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.125,
                      child: Card(
                        elevation: 10,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: mediaQuery.size.width * 0.005)),
                            onPressed: () {
                              context
                                  .read<GameProvider>()
                                  .ChangeTimeZone(zoneName);
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                ClipOval(
                                    child: Image.asset(
                                  'icons/flags/png/${context.watch<GameProvider>().worldZonesApi.elementAt(index)["countryCode"].toString().toLowerCase()}.png',
                                  package: 'country_icons',
                                  height: (mediaQuery.size.height -
                                          appbar.preferredSize.height -
                                          mediaQuery.padding.top) *
                                      0.05,
                                  width: mediaQuery.size.width * 0.12,
                                )),
                                SizedBox(
                                  width: mediaQuery.size.width * 0.15,
                                ),
                                Text(cityName),
                              ],
                            )),
                      ));
                },
                itemCount:
                    context.watch<GameProvider>().worldZonesApi.length)));
  }
}

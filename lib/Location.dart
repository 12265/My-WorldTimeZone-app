import 'package:flutter/material.dart';
import 'package:mainpage/Provider/ProviderData.dart';
import 'package:provider/provider.dart';

class LocationText extends StatelessWidget {
  const LocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(context.watch<GameProvider>().contryChossed.cityName,style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04,color: context.watch<GameProvider>().Textscolor),);
  }
}

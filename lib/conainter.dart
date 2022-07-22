import 'package:flutter/material.dart';
import 'package:mainpage/Provider/ProviderData.dart';
import 'package:provider/provider.dart';

class conainter extends StatelessWidget {
  Widget childs;
  conainter(this.childs);
  Widget build(BuildContext context) {
    return Container(decoration:context.watch<GameProvider>().itsMoring == false ? BoxDecoration(image: DecorationImage(image: AssetImage("Images/night.jpg"),fit: BoxFit.cover)):BoxDecoration(image: DecorationImage(image: AssetImage("Images/mroning.jpg"),fit: BoxFit.cover)),child: childs);
  }
}

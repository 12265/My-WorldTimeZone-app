import 'package:flutter/material.dart';

class DrawingBox extends StatelessWidget {
  @override
  Widget? buttoned;
  DrawingBox(this.buttoned);
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 350,
        child: Card(elevation: 10,child: buttoned),
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(8))));
  }
}

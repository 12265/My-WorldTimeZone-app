import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorChanger extends StatefulWidget {
  @override
  Color theColor;
 Function callme;
  ColorChanger(this.callme,this.theColor);
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.red,
        ),
        child: Card(
          elevation: 15,
          child: ElevatedButton(
              child: null,
              style: ElevatedButton.styleFrom(primary: widget.theColor),
              onPressed: () {
                widget.callme(context);
              }),
        ));
  }


}

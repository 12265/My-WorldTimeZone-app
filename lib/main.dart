import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mainpage/TheRows.dart';
import 'Buttons.dart';
import 'ChooseColor.dart';
import 'DrawingBox.dart';
import 'Slider.dart';
import 'TheColums.dart';

void main() {
  runApp(DrwingGame());
}

class DrwingGame extends StatefulWidget {
  Color theColor = Colors.red;
  @override
  State<DrwingGame> createState() => _DrwingGameState();
}

class _DrwingGameState extends State<DrwingGame> {
  bool visibleSlider = true;
  List<int> ButtonsNumList = [];

  void nothing() {
    setState(() {});
    print("SMDDDDDDDDDDDDDD");
  }

  void resize() {
    if (visibleSlider == false) {
      visibleSlider = true;
      setState(() {});
    } else {
      visibleSlider = false;
      setState(() {});
    }
  }
  void colorchoosed(Color color) {
    widget.theColor = color;
    print(widget.theColor);
  }
  void callme(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Column(
            children: [
              SingleChildScrollView(
                  child: ColorPicker(
                      onColorChanged: colorchoosed, pickerColor: widget.theColor)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop("cancel");setState((){});
                  },
                  child: Text("APPLY"))
            ],
          ),
        ));
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        title: Center(child: Text("helloo")),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CreateButtons(45, 70, 10, 10, resize, title: "Size"),
              CreateButtons(45, 73, 10, 10, nothing, title: "Clear"),
              CreateButtons(45, 120, 10, 10, nothing,
                  title: "Rainbow Colors: Off"),
              ColorChanger(callme,widget.theColor),
            ],
          ),
          Visibility(
              visible: visibleSlider,
              child: StateSlider(ButtonsNumList, nothing)),
          DrawingBox(TheColums(ButtonsNumList,widget.theColor)),
        ],
      ),
    ));
  }
}
import 'package:flutter/material.dart';

class StateSlider extends StatefulWidget {
  @override
  int value = 1;
  Function callbackFunction;
  List<int> buttonsNumList = [];

  StateSlider(this.buttonsNumList,this.callbackFunction);

  State<StateSlider> createState() =>
      _StateSliderState(this.value, this.buttonsNumList,this.callbackFunction);
}

class _StateSliderState extends State<StateSlider> {
  int value;
  List<int> buttonsNumList = [];
  Function callbackFunction;
  _StateSliderState(this.value, this.buttonsNumList,this.callbackFunction);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.red, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
        child: Slider(
        value: value.toDouble(),
    min: 1,
    max: 14,
    label: value.round().toString(),
    divisions: 14,
    onChanged: (value) {setState(() =>
    this.value = value.toInt());
    },
    onChangeEnd: (double newValue) {
          buttonsNumList.clear();
      for(int i = 0;i < value;i+=1)
      {
        buttonsNumList.add(i);
      }
          setState((){
             callbackFunction();
          });
      }
    )));
    }
  }

import 'package:flutter/material.dart';

import 'ChooseColor.dart';

class TheRows extends StatefulWidget {
  List<int> num;
  List<int> buttonPressedNum = [];
  Color? drawingColor;
  TheRows(this.num,this.drawingColor);

  @override
  State<TheRows> createState() => _TheRowsState();
}

class _TheRowsState extends State<TheRows> {
  void nothi(int e) {
    widget.buttonPressedNum.add(e);
    setState(() {});
  }
  Color? choosed(int e) {

    if(widget.buttonPressedNum.contains(e) == true)
      {
        return widget.drawingColor;
       }
    else{
        return Colors.grey;}

  }
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...widget.num.map((e) => Expanded(
          child: Container(
              margin: EdgeInsets.all(0.5),
              width: double.infinity,
              height: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    nothi(e);
                  },
                  child: null,
                  style: ElevatedButton.styleFrom(
                    primary: choosed(e),
                  ))))).toList()
    ]);
  }
}

import 'package:flutter/material.dart';

class CreateButtons extends StatelessWidget {
String? title;
double theHeight =45;
double theWidth =70;
double vertical =10;
double horizontal =10;
final Function nothingatm;
CreateButtons(this.theHeight,this.theWidth,this.vertical,this.horizontal,this.nothingatm,{this.title});

  Widget build(BuildContext context) {
    return Container(
        height: theHeight,
        width: theWidth,
        margin: EdgeInsets.symmetric(vertical: vertical, horizontal:horizontal),decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Colors.red,),
        child: Card(
          child:
          RaisedButton(child: Text("$title"), onPressed:()=> nothingatm()),
          elevation: 15,
        ));
  }
}

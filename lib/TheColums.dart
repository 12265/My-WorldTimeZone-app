import 'package:flutter/material.dart';
import 'TheRows.dart';
class TheColums extends StatefulWidget {
  List<int> numList;
  Color mycolor;
  TheColums(this.numList,this.mycolor);
  State<TheColums> createState() => _TheColumsState();
}

class _TheColumsState extends State<TheColums> {
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...widget.numList
          .map((e) => Expanded(child: TheRows(widget.numList,widget.mycolor)))
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Provider/ProviderData.dart';

class ClockTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("${DateFormat("KK:mm:ss a").format(context.watch<GameProvider>().timeRn)}",style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,color: context.watch<GameProvider>().Textscolor),);
  }
}

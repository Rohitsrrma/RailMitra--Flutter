import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../wigets/TextWidget.dart';

class RunningStatus extends StatelessWidget {
  const RunningStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
            child: CustomTextWidget(
          "Running Status",
          fontSize: 40,
        )),
      ),
    );
  }
}

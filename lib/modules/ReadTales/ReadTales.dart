import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../wigets/TextWidget.dart';

class ReadTales extends StatelessWidget {
  const ReadTales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
            child: CustomTextWidget(
          "Read Tales",
          fontSize: 40,
        )),
      ),
    );
  }
}
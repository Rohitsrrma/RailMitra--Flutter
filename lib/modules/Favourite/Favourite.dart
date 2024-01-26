import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../wigets/TextWidget.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
            child: CustomTextWidget(
          "Favourite",
          fontSize: 40,
        )),
      ),
    );
  }
}

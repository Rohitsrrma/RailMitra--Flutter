import 'package:flutter/material.dart';
import 'package:railmitra/wigets/TextWidget.dart';

class TravelTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
      ),
      Container(
        height: 1,
        width: 30,
        color: Colors.white,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextWidget(
          "11h 48m",
          fontSize: 18,
          fontColor: Colors.white,
        ),
      ),
      Container(
        height: 1,
        width: 30,
        color: Colors.white,
      ),
      Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
      ),
    ]);
  }
}

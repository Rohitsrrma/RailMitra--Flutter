import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railmitra/wigets/TextWidget.dart';

class CustomContainer extends StatelessWidget {
  String icon;
  String title;
  String head;
  CustomContainer(this.icon, this.title, this.head, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: Colors.blue.shade50,
          border: Border.all(width: 1, color: Colors.blue.shade800)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                icon,
                height: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: CustomTextWidget(
                      title,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontColor: Colors.black,
                    ),
                  ),
                  CustomTextWidget(
                    head,
                    fontSize: 10.0,
                    fontWeight: FontWeight.normal,
                    fontColor: Colors.black,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

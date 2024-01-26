import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HorizontalDottedLine extends StatelessWidget {
  const HorizontalDottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              constraints.maxWidth ~/ 15,
              (index) => Row(
                children: [
                  Container(
                    color: Colors.grey,
                    width: 10,
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

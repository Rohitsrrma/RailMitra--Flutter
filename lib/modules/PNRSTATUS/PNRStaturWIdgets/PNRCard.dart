import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railmitra/modules/PNRSTATUS/pnr_status_controller/pnr_status_controller.dart';
import 'package:railmitra/wigets/TextWidget.dart';

import '../../../wigets/HorizontalDottedline.dart';
import '../../../wigets/SizeConfig.dart';

class PNRCARD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PNRSTATUSCONTROLLER pnrstatuscontroller = Get.put(PNRSTATUSCONTROLLER());
    var size = SizeConfig.sizeConfig(context);
    return GetBuilder<PNRSTATUSCONTROLLER>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Flex(direction: Axis.vertical, children: [
          Flexible(
            child: Column(
              children: [
                Container(
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    "PNR: ${pnrstatuscontroller.trainDetail?.pnr}",
                                    fontColor: Colors.black,
                                    fontFamily: "Roboto",
                                    fontSize: 14,
                                  ),
                                  CustomTextWidget(
                                    "AC 3 Tier Sleeper",
                                    fontSize: 12,
                                    fontColor: Colors.grey.shade900,
                                    fontFamily: "Roboto",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: InkWell(
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: CustomTextWidget(
                                            "PNR Copied to ClipBoard",
                                            fontColor: Colors.white,
                                            fontFamily: "Roboto",
                                          ),
                                        ));
                                        print("Icon tapped!");
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.copy,
                                          size: 30,
                                          color: Colors.blue.shade300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10.0, right: 10),
                          child: HorizontalDottedLine(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    "Passenger 1",
                                    fontSize: 14,
                                    fontColor: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Container(
                                        child: Center(
                                            child: CustomTextWidget(
                                          "${pnrstatuscontroller.trainDetail?.passengerInfo[0].currentCoach ?? ""}" +
                                              " " +
                                              "${pnrstatuscontroller.trainDetail?.passengerInfo[0].currentBerthNo ?? ""}",
                                          fontFamily: "Roboto",
                                        )),
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.green.shade300),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.green.shade100)),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomTextWidget(
                                    "Upper Birth",
                                    fontSize: 14,
                                    fontColor: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green.shade400,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        CustomTextWidget(
                                          "Confirmed",
                                          fontSize: 14,
                                          fontColor: Colors.black,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

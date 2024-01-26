import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:railmitra/modules/PNRSTATUS/pnr_status_controller/pnr_status_controller.dart';
import 'package:railmitra/modules/PNRSTATUS/repository/trainDetailsRepository.dart';
import 'package:railmitra/wigets/SizeConfig.dart';
import 'package:railmitra/wigets/TextWidget.dart';

import 'PNRStaturWIdgets/PNRCard.dart';
import 'PNRStaturWIdgets/TravelTimecustomwidget.dart';

class PNRSCREEN extends StatelessWidget {
  const PNRSCREEN({super.key});

  @override
  Widget build(BuildContext context) {
    PNRSTATUSCONTROLLER pnrstatuscontroller = Get.put(PNRSTATUSCONTROLLER());
    var size = SizeConfig.sizeConfig(context);

    return GetBuilder<PNRSTATUSCONTROLLER>(
      builder: (controller) => Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Get.back();
                pnrstatuscontroller
                  ..trainDetail = null
                  ..isRunning.value = true;
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff4856D4),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Image.asset('assets/images/iPhone 13/Square Border.png'),
              )
            ],
            title: CustomTextWidget(
              controller.trainDetail != null
                  ? "${controller.trainDetail?.trainNo} ${controller.trainDetail?.name}"
                  : "",
              fontColor: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: controller.isRunning.value
              ? Center(
                  child: controller.isCircling.value
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.amber),
                        )
                      : CustomTextWidget(
                          "Request Timed Out, Please try again.",
                          fontSize: 18,
                        ))
              : Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(children: [
                    Column(children: [
                      Container(
                        color: Color(0xff4856D4),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 130.0),
                          child: Image.asset("assets/images/iPhone 13/tbt.png"),
                        )),
                      ),
                      Container(height: 200, color: Colors.white),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  "Boarding",
                                  fontSize: 14,
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomTextWidget(
                                  pnrstatuscontroller.trainDetail?.dt ?? "",
                                  fontSize: 14,
                                  fontColor: Colors.grey.shade300,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextWidget(
                                  pnrstatuscontroller
                                          .trainDetail?.sourceDeparture ??
                                      " nall",
                                  fontSize: 14,
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextWidget(
                                  "${pnrstatuscontroller.trainDetail?.boarding ?? ""}" +
                                      " PF " +
                                      "${pnrstatuscontroller.trainDetail?.sourceplatform ?? ""}",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextWidget(
                                  pnrstatuscontroller
                                          .trainDetail?.sourceStation ??
                                      "",
                                  fontSize: 14,
                                  fontColor: Colors.grey.shade300,
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 70.0),
                                child: TravelTimeWidget(),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomTextWidget(
                                "Destination",
                                fontSize: 14,
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomTextWidget(
                                "Sun, 23 Jul",
                                fontSize: 14,
                                fontColor: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                pnrstatuscontroller
                                        .trainDetail?.destinationArrival ??
                                    "",
                                fontSize: 14,
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                "${pnrstatuscontroller.trainDetail?.destination ?? ""}" +
                                    " PF " +
                                    "${pnrstatuscontroller.trainDetail?.destinationPlatform ?? ""}",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontColor: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                pnrstatuscontroller
                                        .trainDetail?.destinationStation ??
                                    "",
                                fontSize: 14,
                                fontColor: Colors.grey.shade300,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(top: 130, child: PNRCARD())
                  ]),
                ))),
    );
  }
}

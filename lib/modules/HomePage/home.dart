import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:railmitra/modules/Favourite/Favourite.dart';
import 'package:railmitra/modules/HomePage/homepageController/homecontroller.dart';
import 'package:railmitra/modules/PNRSTATUS/pnr_status_controller/pnr_status_controller.dart';
import 'package:railmitra/modules/PNRSTATUS/pnrscreen.dart';
import 'package:railmitra/modules/ReadTales/ReadTales.dart';
import 'package:railmitra/modules/RunningStatus/RunningStatus.dart';
import 'package:railmitra/modules/webservice/webservice.dart';
import 'package:railmitra/wigets/SizeConfig.dart';
import 'package:railmitra/wigets/TextWidget.dart';
import '../../wigets/CustomContainerwidget.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    var size = SizeConfig.sizeConfig(context);
    HomeController controller = Get.put(HomeController());
    PNRSTATUSCONTROLLER pnrstatuscontroller = Get.put(PNRSTATUSCONTROLLER());

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/bgtrain.jpeg'),
                Positioned.fill(
                    top: 200,
                    left: 50,
                    right: 50,
                    bottom: 5,
                    child: TextField(
                      maxLength: 10,
                      onTapOutside: (pointerDown) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: controller.trainNameNumberController,
                      onChanged: (text) {
                        if (text.length == 10) {
                          Webservice().getPNRStatus(text);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: CustomTextWidget(
                              'Fetching PNR please wait!',
                              fontFamily: 'Inter',
                              fontColor: Colors.white,
                              fontSize: 14,
                            ),
                          ));
                        }

                        print(text);
                      },
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      // controller: controller.trainNameNumberController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 0, bottom: 20, left: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(62)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(62)),
                          disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(62)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, top: 5, bottom: 5),
                            child: InkWell(
                              onTap: () {
                                print("searchTapped");
                                Get.to(() => PNRSCREEN());
                                FocusScope.of(context).unfocus();

                                pnrstatuscontroller
                                  ..isCircling.value = true
                                  ..isCircling1()
                                  ..getPNStatus(controller
                                      .trainNameNumberController.text);
                              },
                              splashColor: Colors.red,
                              radius: 2,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 0, // Spread radius
                                        blurRadius: 1, // Blur radius
                                        offset: Offset(0,
                                            3), // Offset in the vertical direction
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.blue),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintMaxLines: 1,
                          counterText: "",
                          hintText: "Enter the Train Number or Train Name",
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27),
                          )),
                    ))
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => PNRSCREEN());
                            pnrstatuscontroller.getPNStatus("8605930659");
                          },
                          child: CustomContainer('assets/images/pnr.png',
                              "PNR Status", "Check Trip Status"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.to(() => RunningStatus()),
                          child: CustomContainer('assets/images/runs.png',
                              "Running Status", "Where is my Train?"),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.to(() => Favourite()),
                          child: CustomContainer('assets/images/fav.png',
                              "Favorite", "Save for later"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.to(() => ReadTales()),
                          child: CustomContainer('assets/images/book.png',
                              "Read Tales", "Getting bored!!!?"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomTextWidget(
                  "Recents",
                  fontSize: 20,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: getRecentListView(context, controller)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget getRecentListView(BuildContext ctx, HomeController controller) {
  var listView = ListView.builder(
      // controller: controller.recentScrollCtrl,
      padding: const EdgeInsets.only(top: 10),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: controller.trainList.length,
      itemBuilder: (BuildContext ctx, int i) {
        return Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15, bottom: 5),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    Icons.train_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: CustomTextWidget(
                      controller.trainList[i],
                      fontSize: 14,
                    )),
                Expanded(
                  child: Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      });
  return listView;
}

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hci_parking/controller/map_controller.dart';
import 'package:hci_parking/screen/map_screen.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';
import 'package:hci_parking/widget/home_buttons_widget.dart';
import 'package:hci_parking/widget/home_notice_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MapController _mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: whiteColor,
      child: Scaffold(
        backgroundColor: whiteColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'asset/background.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 89.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 348.w,
                  height: 83.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        offset: const Offset(1, 4),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            '홍길동',
                            style: pretendardMedium18,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            '22000404',
                            style: pretendardMedium14.copyWith(
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            '전산전자공학부',
                            style: pretendardMedium14.copyWith(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 143.w,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'asset/icons/qr_icon.jpg',
                            width: 20.r,
                            height: 20.r,
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Image.asset(
                            'asset/icons/wifi_icon.jpg',
                            width: 14.r,
                            height: 10.8.r,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Image.asset(
                            'asset/icons/bluetooth_icon.jpg',
                            width: 18.r,
                            height: 18.r,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HomeButtonsWidget(
                    buttonIcon: 'asset/icons/check_phone_icon.jpg',
                    buttonWidth: 32,
                    buttonHeight: 32,
                    buttonText: '출석현황',
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  const HomeButtonsWidget(
                    buttonIcon: 'asset/icons/notification_icon.jpg',
                    buttonWidth: 26,
                    buttonHeight: 26,
                    buttonText: '교내주요공지',
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  const HomeButtonsWidget(
                    buttonIcon: 'asset/icons/report_icon.jpg',
                    buttonWidth: 36,
                    buttonHeight: 36,
                    buttonText: '원클릭민원',
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const MapScreen());
                    },
                    child: const HomeButtonsWidget(
                      buttonIcon: 'asset/icons/parking_icon.jpg',
                      buttonWidth: 30,
                      buttonHeight: 30,
                      buttonText: '주차장',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Align(
                alignment: Alignment.center,
                child: HomeNoticeWidget.schoolNoticeWidget,
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.center,
                child: HomeNoticeWidget.schoolTableWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

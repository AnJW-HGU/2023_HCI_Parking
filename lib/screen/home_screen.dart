import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';
import 'package:hci_parking/widget/home_buttons_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          // need: user.name
                        ],
                      ),
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
                    buttonText: '출석현황',
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  const HomeButtonsWidget(
                    buttonText: '교내주요공지',
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  const HomeButtonsWidget(
                    buttonText: '원클릭민원',
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const HomeButtonsWidget(buttonText: '주차장'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

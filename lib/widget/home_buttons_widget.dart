import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';

class HomeButtonsWidget extends StatelessWidget {
  final String buttonText;

  const HomeButtonsWidget({Key? key, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // need: navigation to map page
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 55.r,
            height: 55.r,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(2, 2),
                  blurRadius: 10,
                )
              ],
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            buttonText,
            style: pretendardMedium11,
          ),
        ],
      ),
    );
  }
}

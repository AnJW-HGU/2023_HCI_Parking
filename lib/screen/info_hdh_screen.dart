import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hci_parking/controller/map_controller.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';

class InfoHDHScreen extends StatefulWidget {
  const InfoHDHScreen({super.key});

  @override
  State<InfoHDHScreen> createState() => _InfoHDHScreenState();
}

class _InfoHDHScreenState extends State<InfoHDHScreen> {
  final MapController _mapController = Get.find();

  @override
  void initState() {
    _mapController.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: whiteColor,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          centerTitle: true,
          leading: Container(),
          leadingWidth: 0,
          backgroundColor: whiteColor,
          elevation: 0,
          title: Container(
            width: 363.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: greyColor1,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: iconColor1,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 90.w,
                ),
                Container(
                  width: 78.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: greyColor2,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      '주차장',
                      style: pretendardRegular13.copyWith(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90.w,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.clear_rounded,
                    color: iconColor1,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 55.h,
              color: appBarColor,
              alignment: Alignment.center,
              child: Text(
                'HDH',
                style: pretendardLight20.copyWith(
                  color: whiteColor,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Center(
              child: StreamBuilder(
                stream: _mapController.streamHDH,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      width: 340.w,
                      height: 172.h,
                      alignment: Alignment.center,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: greyColor1,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Image.network(
                        snapshot.data!.img.toString(),
                        width: 340.w,
                        height: 172.h,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return Container(
                      width: 340.w,
                      height: 172.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: greyColor1,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            offset: const Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        'No Video or Image',
                        style: pretendardBlod14,
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Center(
              child: StreamBuilder(
                stream: _mapController.streamHDH,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '주차 가능한 자리 : ${snapshot.data!.empty.toString()}',
                          style: pretendardMedium14,
                        ),
                        Text(
                          '저장된 시간 : ${snapshot.data!.today.toString()} ${snapshot.data!.time.toString()}',
                          style: pretendardMedium14,
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      'No data',
                      style: pretendardMedium14,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

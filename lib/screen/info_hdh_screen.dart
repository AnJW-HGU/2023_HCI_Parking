import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hci_parking/controller/info_controller.dart';
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
  final InfoController _infoController = Get.find();

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
            width: 361.w,
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
                  width: 88.w,
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 55.h,
                color: appBarColor,
                alignment: Alignment.center,
                child: Text(
                  '현동홀',
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
                child: SizedBox(
                  width: 340.w,
                  child: StreamBuilder(
                    stream: _mapController.streamHDH,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        String year =
                            snapshot.data!.today?.substring(0, 4) ?? '0000';
                        String month =
                            snapshot.data!.today?.substring(4, 6) ?? '00';
                        String day =
                            snapshot.data!.today?.substring(6, 8) ?? '00';
                        List<String> time = snapshot.data!.time?.split(':') ??
                            ['00', '00', '00'];

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '$year년 $month월 $day일 ${time[0]}시 ${time[1]}분',
                              style: pretendardMedium14,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '" ${snapshot.data!.empty.toString()} ',
                                  style: pretendardBlod14.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '자리 주차 가능합니다. "',
                                  style: pretendardMedium18,
                                ),
                              ],
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
              ),
              SizedBox(
                height: 100.h,
              ),
              Center(
                child: Text(
                  '< 평균 빈자리 >',
                  style: pretendardRegular13.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: StreamBuilder(
                  stream: _infoController.streamHDH9,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      List<String> dataX = ['9-11', '11-13', '13-15', '15-17'];
                      snapshot.data!.forEach((element) {
                        _infoController.hdh9 +=
                            int.parse(element.empty.toString());
                      });
                      _infoController.hdh9 /= snapshot.data!.length;

                      return StreamBuilder(
                        stream: _infoController.streamHDH11,
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            snapshot.data!.forEach((element) {
                              _infoController.hdh11 +=
                                  int.parse(element.empty.toString());
                            });
                            _infoController.hdh11 /= snapshot.data!.length;

                            return StreamBuilder(
                              stream: _infoController.streamHDH13,
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  snapshot.data!.forEach((element) {
                                    _infoController.hdh13 +=
                                        int.parse(element.empty.toString());
                                  });
                                  _infoController.hdh13 /=
                                      snapshot.data!.length;

                                  return StreamBuilder(
                                    stream: _infoController.streamHDH15,
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        snapshot.data!.forEach((element) {
                                          _infoController.hdh15 += int.parse(
                                              element.empty.toString());
                                        });
                                        _infoController.hdh15 /=
                                            snapshot.data!.length;

                                        return SizedBox(
                                          width: 340.w,
                                          height: 160.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              makeGraph(
                                                data: _infoController.hdh9,
                                                title: '9-11시',
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              makeGraph(
                                                data: _infoController.hdh11,
                                                title: '11-13시',
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              makeGraph(
                                                data: _infoController.hdh13,
                                                title: '13-15시',
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              makeGraph(
                                                data: _infoController.hdh15,
                                                title: '15-17시',
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return SizedBox(
                                          width: 340.w,
                                          height: 180.h,
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  return SizedBox(
                                    width: 340.w,
                                    height: 180.h,
                                  );
                                }
                              },
                            );
                          } else {
                            return SizedBox(
                              width: 340.w,
                              height: 180.h,
                            );
                          }
                        },
                      );
                    } else {
                      return SizedBox(
                        width: 340.w,
                        height: 180.h,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeGraph({required var data, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data.toString().substring(0, 3),
          style: pretendardMedium11,
        ),
        Container(
          width: 40.w,
          height: data / 4 * 120.h,
          color: secondaryColor.withOpacity(0.5),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          title,
          style: pretendardMedium13,
        ),
      ],
    );
  }
}

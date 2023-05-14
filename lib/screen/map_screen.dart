import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hci_parking/controller/map_controller.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = Get.find();
  late GoogleMapController _googleMapController;

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

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
        body: Center(
          child: GestureDetector(
            onTap: () {
              // need: Navigation to info screen
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HDH's empty : ",
                  style: pretendardRegular20,
                ),
                StreamBuilder(
                  stream: _mapController.streamHDH,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Text(
                        snapshot.data!.empty.toString(),
                        style: pretendardRegular20,
                      );
                    } else {
                      return Text(
                        '0',
                        style: pretendardRegular20,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        // body: Stack(
        //   children: [
        //     Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           // need: Navigation to info screen
        //         },
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "HDH's empty : ",
        //               style: pretendardRegular20,
        //             ),
        //             Text(
        //               _mapController.emptyHDH,
        //               style: pretendardRegular20,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     const GoogleMap(
        //       initialCameraPosition: CameraPosition(
        //         target: LatLng(45.521563, -122.677433),
        //         zoom: 11.0,
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

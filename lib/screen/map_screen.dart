import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hci_parking/controller/info_controller.dart';
import 'package:hci_parking/controller/map_controller.dart';
import 'package:hci_parking/screen/info_hdh_screen.dart';
import 'package:hci_parking/util/color.dart';
import 'package:hci_parking/util/test_style.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = Get.find();
  final InfoController _infoController = Get.put(InfoController());
  late GoogleMapController _googleMapController;
  Set<Marker> markers = <Marker>{};
  final markerKey = GlobalKey();

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  void initState() {
    _mapController.init();

    super.initState();
  }

  Future<Set<Marker>> getHDHMarker({required String empty}) async {
    const LatLng showLocation = LatLng(36.103783, 129.388944);

    final Uint8List markerIcon = await getBytesFromCanvas(empty: empty);

    setState(() {
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: showLocation,
        infoWindow: const InfoWindow(
          title: '현동홀',
        ),
        icon: BitmapDescriptor.fromBytes(markerIcon),
        onTap: () {
          Get.to(const InfoHDHScreen());
        },
      ));
    });

    return markers;
  }

  Future<Uint8List> getBytesFromCanvas({required String empty}) async {
    const double width = 200;
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = primaryColor.withOpacity(0.7);
    Radius radius = const Radius.circular(width);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), width.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: empty,
      style: pretendardRegular20.copyWith(
        color: whiteColor,
        fontSize: 70,
      ),
    );

    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (width * .5) - painter.height * 0.5));
    final img = await pictureRecorder
        .endRecording()
        .toImage(width.toInt(), width.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
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
        body: StreamBuilder(
          stream: _mapController.streamHDH,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              getHDHMarker(empty: snapshot.data!.empty.toString());
            } else {
              getHDHMarker(empty: '0');
            }
            return GoogleMap(
              zoomGesturesEnabled: true,
              initialCameraPosition: const CameraPosition(
                target: LatLng(36.103350, 129.388625),
                zoom: 17.0,
              ),
              mapType: MapType.normal,
              markers: markers,
              onMapCreated: (controller) {
                setState(() {
                  _onMapCreated(controller);
                });
              },
            );
          },
        ),
      ),
    );
  }
}

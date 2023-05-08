import 'package:get/get.dart';
import 'package:hci_parking/model/maps.dart';
import 'package:hci_parking/repository/map_repository.dart';

class MapController extends GetxController {
  late Stream<List<Maps>> streamHDH;
  String emptyHDH = "0";

  MapController() {
    init();
  }

  Future<void> init() async {
    streamHDH = MapRepository().getHDH();
    update();
    streamHDH.forEach((element) {
      if (element.first.empty != null) {
        emptyHDH = element.first.empty!;
        update();
      }
    });
  }
}

import 'package:get/get.dart';
import 'package:hci_parking/model/data.dart';
import 'package:hci_parking/repository/info_repository.dart';

class InfoController extends GetxController {
  late Stream<List<Data>> streamHDH9;
  late Stream<List<Data>> streamHDH11;
  late Stream<List<Data>> streamHDH13;
  late Stream<List<Data>> streamHDH15;

  var hdh9 = 0.0;
  var hdh11 = 0.0;
  var hdh13 = 0.0;
  var hdh15 = 0.0;

  InfoController() {
    init();
  }

  Future<void> init() async {
    streamHDH9 = InfoRepository().getHDH9();
    streamHDH11 = InfoRepository().getHDH11();
    streamHDH13 = InfoRepository().getHDH13();
    streamHDH15 = InfoRepository().getHDH15();
    update();
  }
}

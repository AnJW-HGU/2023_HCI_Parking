import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hci_parking/model/maps.dart';

class MapRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<Maps> getHDH() {
    final snapshot = _firestore
        .collection('HDH')
        // .orderBy('closeTime', descending: true)
        .snapshots();
    return snapshot.map((snapshot) {
      Maps result = Maps();
      try {
        result = snapshot.docs
            .map(
              (e) => Maps.fromJson(e.data()),
            )
            .toList()
            .last;
      } catch (e) {
        rethrow;
      }
      return result;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hci_parking/model/data.dart';

class InfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Data>> getHDH9() {
    final snapshot =
        _firestore.collection('Data').doc('수요일').collection('9-11').snapshots();
    return snapshot.map((snapshot) {
      List<Data> result = [];
      try {
        result = snapshot.docs
            .map(
              (e) => Data.fromJson(e.data()),
            )
            .toList();
      } catch (e) {
        rethrow;
      }
      return result;
    });
  }

  Stream<List<Data>> getHDH11() {
    final snapshot = _firestore
        .collection('Data')
        .doc('수요일')
        .collection('11-13')
        .snapshots();
    return snapshot.map((snapshot) {
      List<Data> result = [];
      try {
        result = snapshot.docs
            .map(
              (e) => Data.fromJson(e.data()),
            )
            .toList();
      } catch (e) {
        rethrow;
      }
      return result;
    });
  }

  Stream<List<Data>> getHDH13() {
    final snapshot = _firestore
        .collection('Data')
        .doc('수요일')
        .collection('13-15')
        .snapshots();
    return snapshot.map((snapshot) {
      List<Data> result = [];
      try {
        result = snapshot.docs
            .map(
              (e) => Data.fromJson(e.data()),
            )
            .toList();
      } catch (e) {
        rethrow;
      }
      return result;
    });
  }

  Stream<List<Data>> getHDH15() {
    final snapshot = _firestore
        .collection('Data')
        .doc('수요일')
        .collection('15-17')
        .snapshots();
    return snapshot.map((snapshot) {
      List<Data> result = [];
      try {
        result = snapshot.docs
            .map(
              (e) => Data.fromJson(e.data()),
            )
            .toList();
      } catch (e) {
        rethrow;
      }
      return result;
    });
  }
}

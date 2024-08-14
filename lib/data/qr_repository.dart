import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final FirebaseDatabase _firebaseRealtime = FirebaseDatabase.instance;
class QRRepository {

  /// Firebase Firestore
  static Future<Map<String, dynamic>?> getDoc(String code) async {
    print(code);
    Map<String, dynamic>? qr = await _firebaseFirestore
        .collection("qr")
        .doc(code)
        .get()
        .then((value) async {
          return value.data();
        })
        .onError((error, stackTrace) {
          print("Error getting the qr code, $error");
          return null;
        });
    return qr;
  }

  /// Firebase Realtime Database
  static void initQRCount(String code) async {
    DatabaseReference qrRef = _firebaseRealtime.ref('qr_count');
    await qrRef.set({
      code: 1,
    }).then((_) {
      print("Success");
    }).onError((error, stackTrace) {
      print("Error setting the count, $error");
    });
  }

  static void incrementQRCount(String code) async {
    DatabaseReference qrRef = _firebaseRealtime.ref('qr_count');
    await qrRef.set({
      code: ServerValue.increment(1),
    });
  }

  static Future<DataSnapshot> getQRCount(String code) async {
    final qrRefCount = _firebaseRealtime.ref('qr_count/$code');
    return (await qrRefCount.get());
  }

  static void initQRCurse(String code, ability) async {
    DatabaseReference qrRefCurse = _firebaseRealtime.ref('curse');
    await qrRefCurse.set({
      code: ability,
    }).then((_) {
      print("Success");
    }).onError((error, stackTrace) {
      print("Error setting the curse, $error");
    });
  }

  static Future<DataSnapshot> getQRCurse(String code) async {
    final qrRef = _firebaseRealtime.ref('curse/$code');
    return (await qrRef.get());
  }

}

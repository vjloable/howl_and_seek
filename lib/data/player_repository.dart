import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/player_model.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class PlayerRepository {

  static Future<String> setPermissionLevel(Player player, int level) {
    return _firebaseFirestore
        .collection("players")
        .withConverter(
      fromFirestore: Player.fromFirestore,
      toFirestore: (Player player, options) => player.toFirestore(),
    )
        .doc(player.uid)
        .update({"permissionLevel": level})
        .then((_) {
          print("Successfully updated permission level");
          return "Success";
        }).onError((error, stackTrace) {
          print("Error updated permission level");
          return "Error";
        });
  }

  static Player? initDoc(String email, String uid, String name) {
    Player player = Player(email: email, uid: uid, name: name);
    _firebaseFirestore
        .collection("players")
        .withConverter(
      fromFirestore: Player.fromFirestore,
      toFirestore: (Player player, options) => player.toFirestore(),
    )
        .doc(uid)
        .set(player, SetOptions(merge: true))
        .then((_) {
      print("Successfully added player id");
    }).onError((error, stackTrace) {
      print("Error adding player id");
      return null;
    });
    return player;
  }

  static Future<Player?> getDoc(String uid) async {
    Future<Player?> player = _firebaseFirestore
        .collection("players")
        .doc(uid)
        .withConverter(
      fromFirestore: Player.fromFirestore,
      toFirestore: (Player player, _) => player.toFirestore(),
    )
        .get()
        .then((value) async {
          return value.data();
    }).onError((error, stackTrace) {
      print("Error getting the player by uid, $error");
      return null;
    });
    return player;
  }

  static Future<List<QueryDocumentSnapshot<Player>>> getDocs() {
    return _firebaseFirestore
        .collection("players")
        .withConverter(fromFirestore: Player.fromFirestore, toFirestore: (Player player, options) => player.toFirestore(),)
        .get()
        .then((QuerySnapshot<Player> querySnapshot) => querySnapshot.docs.cast()
    );
  }

}

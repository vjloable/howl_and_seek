import 'package:cloud_firestore/cloud_firestore.dart';

class Player{
  final String uid;
  final String? name;
  final String? email;
  final DateTime? createdAt;
  final DateTime? lastScan;
  final bool isLocked;
  final bool hasPaid;
  final int permissionLevel;
  final int permissionMax;
  final int shields;
  final double points;
  final String? ability;

  Player({
    this.name = "",
    required this.uid,
    this.createdAt,
    this.lastScan,
    required this.email,
    this.isLocked = true,
    this.hasPaid = false,
    this.permissionLevel = 0,
    this.permissionMax = 0,
    this.shields = 0,
    this.points = 0,
    this.ability,
  });

  factory Player.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Player(
      name: data?['name'] ?? "",
      email: data?['email'] ?? "",
      uid: data?['uid'],
      createdAt: (data?['creation'] as Timestamp).toDate(),
      lastScan: data?['lastScan'] == null ? null : ((data?['lastScan'] as Timestamp).toDate()),
      isLocked: data?['isLocked'],
      hasPaid: data?['hasPaid'],
      permissionLevel: data?['permissionLevel'],
      permissionMax: data?['permissionMax'],
      shields: data?['shields'],
      points: data?['points'],
      ability: data?['ability'],
    );
  }

  Map<String, dynamic> toFirestore() {
    var serverTimestamp = FieldValue.serverTimestamp();
    return {
      if (name != null) "name": name else "name": "",
      if (email != null) "email" : email else "email" : "",
      "uid": uid,
      if (createdAt != null) "creation" : createdAt else "creation" : serverTimestamp,
      if (lastScan != null) "birthdate" : lastScan else "lastScan" : null,
      "isLocked": isLocked,
      "hasPaid": hasPaid,
      "permissionLevel": permissionLevel,
      "permissionMax": permissionMax,
      "shields": shields,
      "points": points,
      "ability": ability,
    };
  }
}
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:howl_and_seek/data/qr_repository.dart';
import 'package:howl_and_seek/services/abilities.dart';
import 'package:howl_and_seek/utils/custom_colors.dart';

import '../../domain/player_model.dart';

class QRCheckerScreen extends StatefulWidget {
  final String code;
  final Player player;
  const QRCheckerScreen({super.key, required this.code, required this.player});

  @override
  State<QRCheckerScreen> createState() => _QRCheckerScreenState();
}

class _QRCheckerScreenState extends State<QRCheckerScreen> {
  User user = FirebaseAuth.instance.currentUser!;

  double getTotalPoints(DataSnapshot qrCountSnapshot, double base) {
    if (qrCountSnapshot.exists) {
      int qrCount = (int.parse(qrCountSnapshot.value.toString())-1);
      double scanPoint = base * pow(0.95, qrCount);
      QRRepository.incrementQRCount(widget.code);
      return scanPoint;
    } else {
      double scanPoint = base * pow(0.95, 0);
      QRRepository.initQRCount(widget.code);
      return scanPoint;
    }
  }

  void _checkQR() {
    QRRepository.getDoc(widget.code).then((qr) async {
      double qrBaseValue = qr!["value"];
      QRRepository.getQRCount(widget.code).then((qrCountSnapshot) async {
        double totalPoints = getTotalPoints(qrCountSnapshot, qrBaseValue);
        QRRepository.getQRCurse(widget.code).then((curseSnapshot) {
          String curse = curseSnapshot.exists ? curseSnapshot.value.toString() : "";
          switch (curse) {
            case "huntsgamble":
              Abilities.huntsGamble(totalPoints);
              break;
            case "savagemark":
              Abilities.savageMark(qrBaseValue, (int.parse(qrCountSnapshot.value.toString())-1));
              break;
            case "moonlitward":
              Abilities.moonlitWard(totalPoints);
              break;
            case "bloodlash":
              Abilities.bloodlash(totalPoints);
              break;
          }
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _checkQR();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.premiumBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  color: CustomColors.primaryAccent,
                  strokeWidth: 5,
                  value: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

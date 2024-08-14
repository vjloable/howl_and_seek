import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../common_widgets/rounded_elevated_button.dart';
import '../domain/player_model.dart';
import '../utils/custom_colors.dart';

class ReceiveScreen extends StatefulWidget {
  final Player player;
  const ReceiveScreen({super.key, required this.player,});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.darkBackground,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: RoundedElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: Colors.transparent,
                          overlayColor: CustomColors.light,
                          borderColor: CustomColors.light,
                          borderSide: BorderSide(color: CustomColors.light),
                          height: 30,
                          child: Text("BACK", style: TextStyle(color: CustomColors.light, fontSize: 12, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 48,
                  child: Text("SEEK", style: TextStyle(color: CustomColors.primaryAccent, fontSize: 32, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 20),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: QrImageView(
                            data: "widget.player.uid",
                            version: QrVersions.auto,
                            size: 400,
                            backgroundColor: CustomColors.light,
                            dataModuleStyle: QrDataModuleStyle(color: CustomColors.secondaryBackground, dataModuleShape: QrDataModuleShape.square),
                            eyeStyle: QrEyeStyle(color: CustomColors.secondaryBackground, eyeShape: QrEyeShape.square),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      "Show this QR Code to NPCs to earn some howl points",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColors.light,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
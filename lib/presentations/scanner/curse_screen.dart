import 'package:flutter/material.dart';

import '../../common_widgets/rounded_elevated_button.dart';
import '../../utils/custom_colors.dart';
import '../../utils/custom_icons.dart';

class CurseScreen extends StatefulWidget {
  const CurseScreen({super.key});

  @override
  State<CurseScreen> createState() => _CurseScreenState();
}

class _CurseScreenState extends State<CurseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: CustomColors.premiumBackground),
            ),
          ),
          Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: 600,
                  height: 700,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 120),
                        Center(child: CustomIcons.pawsBig(CustomColors.primaryAccent)),
                        const SizedBox(height: 60),
                        Text(
                          "+20",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.primaryAccent,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "LUCKY FIND!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "You’ve got X howl points for this QR code. \nThere are no signs of cursed marks on this one.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).add(const EdgeInsets.only(bottom: 60)),
                    child: SizedBox(
                      height: 50,
                      child: RoundedElevatedButton(
                        onPressed: () {

                        },
                        backgroundColor: CustomColors.primaryAccent,
                        overlayColor: CustomColors.secondaryBackground,
                        borderColor: CustomColors.primaryAccent,
                        child: Text("OBTAIN", style: TextStyle(color: CustomColors.secondaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

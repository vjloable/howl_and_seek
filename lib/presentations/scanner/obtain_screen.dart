import 'package:flutter/material.dart';

import '../../common_widgets/rounded_elevated_button.dart';
import '../../utils/custom_colors.dart';
import '../../utils/custom_icons.dart';

class ObtainScreen extends StatefulWidget {
  final bool isPositive;
  const ObtainScreen({super.key, required this.isPositive});

  @override
  State<ObtainScreen> createState() => _ObtainScreenState();
}

class _ObtainScreenState extends State<ObtainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.premiumBackground,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
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
                        Center(child: CustomIcons.pawsBig(widget.isPositive ? CustomColors.primaryAccent : CustomColors.error)),
                        const SizedBox(height: 60),
                        Text(
                          "+20",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.isPositive ? CustomColors.primaryAccent : CustomColors.error,
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          widget.isPositive ? "LUCKY FIND!" : "TOUGH LUCK!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.isPositive
                              ? "You’ve got X howl points for this QR code. \nThere are no signs of cursed marks on this one."
                              : "Deducted X howl points from your account.",
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
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.close, color: CustomColors.light),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).add(const EdgeInsets.only(bottom: 60)),
                    child: SizedBox(
                      height: 50,
                      child: RoundedElevatedButton(
                        onPressed: () {

                        },
                        backgroundColor: widget.isPositive ? CustomColors.primaryAccent : CustomColors.error,
                        overlayColor: CustomColors.secondaryBackground,
                        borderColor: widget.isPositive ? CustomColors.primaryAccent : CustomColors.error,
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

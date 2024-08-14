import 'package:flutter/material.dart';

import '../../common_widgets/rounded_elevated_button.dart';
import '../../utils/custom_colors.dart';

class CurseHeroScreen extends StatefulWidget {
  final String title;
  final Widget icon;
  const CurseHeroScreen({super.key, required this.title, required this.icon});

  @override
  State<CurseHeroScreen> createState() => _CurseHeroScreenState();
}

class _CurseHeroScreenState extends State<CurseHeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.strongBackground,
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
                        const SizedBox(height: 60),
                        Center(child: widget.icon),
                        const SizedBox(height: 20),
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 160),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).add(const EdgeInsets.only(bottom: 10)),
                    child: SizedBox(
                      height: 50,
                      child: RoundedElevatedButton(
                        onPressed: () {

                        },
                        backgroundColor: CustomColors.light,
                        overlayColor: CustomColors.secondaryBackground,
                        borderColor: CustomColors.light,
                        child: Text("USE SHIELD", style: TextStyle(color: CustomColors.secondaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).add(const EdgeInsets.only(bottom: 60)),
                    child: SizedBox(
                      height: 50,
                      child: RoundedElevatedButton(
                        onPressed: () {

                        },
                        backgroundColor: CustomColors.secondaryBackground,
                        overlayColor: CustomColors.error,
                        borderColor: CustomColors.secondaryBackground,
                        child: Text("OBTAIN", style: TextStyle(color: CustomColors.error, fontSize: 16, fontWeight: FontWeight.w800)),
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

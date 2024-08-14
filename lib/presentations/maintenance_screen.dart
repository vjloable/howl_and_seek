import 'package:flutter/material.dart';
import 'package:howl_and_seek/application/authentication_service.dart';
import 'package:howl_and_seek/utils/custom_icons.dart';
import '../common_widgets/rounded_elevated_button.dart';
import '../utils/custom_colors.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.primaryBackground,
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
                        Center(child: CustomIcons.maintenance(CustomColors.primaryAccent)),
                        const SizedBox(height: 60),
                        Text(
                          "MAINTENANCE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "IN PROGRESS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          "We are still placing tracks in the game area . . .",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.light,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
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
                          Navigator.of(context).pop();
                          AuthenticationService.signOut();
                          Navigator.of(context).maybePop();
                        },
                        backgroundColor: CustomColors.primaryAccent,
                        overlayColor: CustomColors.secondaryBackground,
                        borderColor: CustomColors.primaryAccent,
                        child: Text("GO BACK", style: TextStyle(color: CustomColors.secondaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
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
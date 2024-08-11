import 'package:flutter/material.dart';
import 'package:howl_and_seek/presentations/register_screen.dart';
import 'package:howl_and_seek/utils/custom_colors.dart';
import 'package:howl_and_seek/utils/graphics.dart';

import '../common_widgets/rounded_elevated_button.dart';
import 'login_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Illustration.background,
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Howl",
                        style: TextStyle(
                          color: CustomColors.primaryAccent,
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(color: CustomColors.primaryAccent.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 4))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 31,
                        height: 72,
                        child: Center(
                          child: Text(
                            "&",
                            style: TextStyle(
                              color: CustomColors.light,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Seek",
                        style: TextStyle(
                          color: CustomColors.light,
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(color: CustomColors.light.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 4))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 5, color: CustomColors.light),),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                    color: CustomColors.secondaryBackground.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        RoundedElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                          },
                          backgroundColor: Colors.transparent,
                          overlayColor: CustomColors.light,
                          borderColor: CustomColors.light,
                          child: Text("REGISTER", style: TextStyle(color: CustomColors.light, fontSize: 16, fontWeight: FontWeight.w800)),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 18,
                          child: Text("OR", style: TextStyle(color: CustomColors.light, fontSize: 12, fontWeight: FontWeight.w300)),
                        ),
                        const SizedBox(height: 10),
                        RoundedElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                          },
                          backgroundColor: CustomColors.primaryAccent,
                          overlayColor: CustomColors.primaryBackground,
                          child: Text("LOG-IN", style: TextStyle(color: CustomColors.primaryBackground, fontSize: 16, fontWeight: FontWeight.w800)),
                        ),
                      ],
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

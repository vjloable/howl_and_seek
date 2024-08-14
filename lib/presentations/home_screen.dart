import 'package:flutter/material.dart';
import 'package:howl_and_seek/presentations/receive_screen.dart';
import 'package:howl_and_seek/presentations/scanner/curse_hero_screen.dart';
import 'package:howl_and_seek/presentations/scanner/seek_screen.dart';
import 'package:intl/intl.dart';

import '../common_widgets/rounded_elevated_button.dart';
import '../domain/player_model.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_icons.dart';

class HomeScreen extends StatefulWidget {
  final Player? player;
  const HomeScreen({super.key, required this.player});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: Tween(begin: const Offset(0, -0.3), end: const Offset(0, 0)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic)),
          child: Container(
            height: 200,
            constraints: const BoxConstraints(
                minHeight: 200, minWidth: double.infinity,
                maxHeight: double.infinity
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.accentBackground,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(5000),
                bottomLeft: Radius.circular(5000),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 90),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: CustomIcons.home(CustomColors.secondaryBackground),
                          ),
                          Text("HOME", style: TextStyle(letterSpacing: 1.15, color: CustomColors.secondaryBackground, fontSize: 32, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: FittedBox(
              child: FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Curves.ease)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: CustomIcons.paws(CustomColors.secondaryBackground),
                    ),
                    const SizedBox(height: 10),
                    Text(NumberFormat.currency(name: "").format(widget.player!.points), style: TextStyle(color: CustomColors.secondaryBackground, fontSize: 40, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Text("HOWL POINTS", style: TextStyle(color: CustomColors.secondaryBackground, fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SlideTransition(
            position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic)),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: CustomColors.accentBackground,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5000),
                  topRight: Radius.circular(5000),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: 80,
                          height: 120,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: RoundedElevatedButton(
                                    backgroundColor: CustomColors.secondaryBackground,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurseHeroScreen(
                                        title: "HUNT’S GAMBLE",
                                        icon: CustomIcons.moonlitWard(CustomColors.light),
                                      ),));
                                    },
                                    overlayColor: CustomColors.light,
                                    child: CustomIcons.howl(CustomColors.light),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: Center(
                                    child: Text(
                                      "HOWL",
                                      style: TextStyle(
                                        letterSpacing: 1.15,
                                        color: CustomColors.secondaryBackground,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: 80,
                          height: 120,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: RoundedElevatedButton(
                                    backgroundColor: CustomColors.light,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiveScreen(player: widget.player!)));
                                    },
                                    overlayColor: CustomColors.secondaryBackground,
                                    child: CustomIcons.receive(CustomColors.secondaryBackground),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: Center(
                                    child: Text(
                                      "RECEIVE",
                                      style: TextStyle(
                                        letterSpacing: 1.15,
                                        color: CustomColors.secondaryBackground,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: 80,
                          height: 120,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: RoundedElevatedButton(
                                    backgroundColor: CustomColors.secondaryBackground,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeekScreen(player: widget.player!,)));
                                    },
                                    overlayColor: CustomColors.light,
                                    child: CustomIcons.seek(CustomColors.light),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: Center(
                                    child: Text(
                                      "SEEK",
                                      style: TextStyle(
                                        letterSpacing: 1.15,
                                        color: CustomColors.secondaryBackground,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

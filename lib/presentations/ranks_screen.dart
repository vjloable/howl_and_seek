import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_icons.dart';

class RanksScreen extends StatefulWidget {
  const RanksScreen({super.key});

  @override
  State<RanksScreen> createState() => _RanksScreenState();
}

class _RanksScreenState extends State<RanksScreen> with TickerProviderStateMixin{
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
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 200,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 375,
                  height: 345,
                  child: Row(
                    children: [
                      Expanded(
                        child: SlideTransition(
                          position: Tween(begin: const Offset(0, -0.3), end: const Offset(0, 0)).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: const Interval(
                                0,
                                1,
                                curve: Curves.elasticOut,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 208,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Juan dela Cruz",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: CustomColors.secondaryBackground,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: CustomColors.secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(200),
                                            border: GradientBoxBorder(
                                              width: 5,
                                              gradient: LinearGradient(
                                                colors: CustomColors.silver,
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                              ),
                                            ),
                                          ),
                                          child: Center(child: Text("2", style: TextStyle(color: CustomColors.light, fontSize: 20, fontWeight: FontWeight.w900))),
                                        ),
                                        const SizedBox(height: 10),
                                        Expanded(child: VerticalDivider(color: CustomColors.light, thickness: 5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SlideTransition(
                          position: Tween(begin: const Offset(0, -0.3), end: const Offset(0, 0)).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: const Interval(
                                0.1,
                                1,
                                curve: Curves.elasticOut,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 145,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Carlos Yulo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: CustomColors.secondaryBackground,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: CustomColors.secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(200),
                                            border: GradientBoxBorder(
                                              width: 5,
                                              gradient: LinearGradient(
                                                colors: CustomColors.gold,
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                              ),
                                            ),
                                          ),
                                          child: Center(child: Text("1", style: TextStyle(color: CustomColors.light, fontSize: 20, fontWeight: FontWeight.w900))),
                                        ),
                                        const SizedBox(height: 10),
                                        Expanded(child: VerticalDivider(color: CustomColors.light, thickness: 5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SlideTransition(
                          position: Tween(begin: const Offset(0, -0.3), end: const Offset(0, 0)).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: const Interval(
                                0.2,
                                1,
                                curve: Curves.elasticOut,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 245,
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Juan dela Cruz",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: CustomColors.secondaryBackground,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: CustomColors.secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(200),
                                            border: GradientBoxBorder(
                                              width: 5,
                                              gradient: LinearGradient(
                                                colors: CustomColors.bronze,
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                              ),
                                            ),
                                          ),
                                          child: Center(child: Text("3", style: TextStyle(color: CustomColors.light, fontSize: 20, fontWeight: FontWeight.w900))),
                                        ),
                                        const SizedBox(height: 10),
                                        Expanded(child: VerticalDivider(color: CustomColors.light, thickness: 5)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SlideTransition(
                position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    border: Border(top: BorderSide(width: 5, color: CustomColors.secondaryBackground)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: List.generate(10, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Stack(
                            children: [
                              Container(
                                height: 30,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: CustomColors.primaryBackground.withOpacity(0.75),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Juan de la cruz", overflow: TextOverflow.ellipsis, style: TextStyle(color: CustomColors.light, fontSize: 10, fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: CustomColors.light,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(child: Text("${index+4}", style: TextStyle(color: CustomColors.light, fontSize: 12, fontWeight: FontWeight.w500))),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 30,
                                  width: 120,
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text("1,000,000,000", style: TextStyle(color: CustomColors.light, fontSize: 10, fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SlideTransition(
            position: Tween(begin: const Offset(0, -0.3), end: const Offset(0, 0)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOutCubic)),
            child: Container(
              height: 200,
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
                              child: CustomIcons.ranks(CustomColors.secondaryBackground),
                            ),
                            Text("RANKS", style: TextStyle(letterSpacing: 1.15, color: CustomColors.secondaryBackground, fontSize: 32, fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:howl_and_seek/data/player_repository.dart';

import '../domain/player_model.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_icons.dart';

class RanksScreen extends StatefulWidget {
  final Player player;
  const RanksScreen({super.key, required this.player});

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
              FutureBuilder(
                future: PlayerRepository.getPoints(),
                builder: (context, snapshot ) {
                  if (snapshot.hasData) {
                    Iterable<DataSnapshot> ranks = snapshot.data!.toList().reversed;
                    List<String> gold = snapshot.data!.isNotEmpty ? ranks.elementAt(0).key.toString().split("_") : ["0","-"];
                    List<String> silver = snapshot.data!.length >= 2 ? ranks.elementAt(1).key.toString().split("_") : ["0","-"];
                    List<String> bronze = snapshot.data!.length >= 3 ?ranks.elementAt(2).key.toString().split("_") : ["0","-"];
                    return Column(
                      children: [
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
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    silver.last,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: CustomColors.secondaryBackground,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "(${ranks.elementAtOrNull(1)?.value.toString() ?? "-"})",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: CustomColors.secondaryBackground,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
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
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    gold.last,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: CustomColors.secondaryBackground,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "(${ranks.elementAtOrNull(0)?.value.toString() ?? "-"})",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: CustomColors.secondaryBackground,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
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
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    bronze.last,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: CustomColors.secondaryBackground,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "(${ranks.elementAtOrNull(2)?.value.toString() ?? "-"})",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: CustomColors.secondaryBackground,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
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
                                children: List.generate(ranks.length-3 < 1 ? 7 : ranks.length-3, (index) {
                                  List<String> rankItem = ranks.length-3 < 1 ? ["","-"] : ranks.elementAt(index+3).key.toString().split("_");
                                  String rankItemPoints = ranks.length-3 < 1 ? "-" : ranks.elementAt(index+3).value.toString();
                                  print(rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? "green" : "red"): "");
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(40),
                                            color: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? CustomColors.primaryBackground : CustomColors.primaryBackground.withOpacity(0.75)): CustomColors.primaryBackground.withOpacity(0.75),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 40),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                rankItem.last,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? CustomColors.primaryAccent : CustomColors.light): CustomColors.light,
                                                  fontSize: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? 14 : 10): 10,
                                                  fontWeight: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? FontWeight.w900 : FontWeight.w500): FontWeight.w500,
                                                ),
                                              ),
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
                                                color: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? CustomColors.primaryAccent : CustomColors.light): CustomColors.light,
                                                width: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? 3 : 1): 1,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${index+4}",
                                                style: TextStyle(
                                                  color: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? CustomColors.primaryAccent : CustomColors.light): CustomColors.light,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                            height: 30,
                                            width: 120,
                                            child: Center(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5),
                                                  child: Text(
                                                    rankItemPoints,
                                                    style: TextStyle(
                                                      color: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? CustomColors.primaryAccent : CustomColors.light): CustomColors.light,
                                                      fontSize: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? 14 : 10): 10,
                                                      fontWeight: rankItem.first.isNotEmpty ? (rankItem.first == widget.player.uid ? FontWeight.w900 : FontWeight.w500): FontWeight.w500,
                                                    ),
                                                  ),
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
                    );
                  } else if (snapshot.hasError) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(
                            color: CustomColors.error,
                            value: null,
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: CustomColors.primaryAccent,
                          value: null,
                        ),
                      ),
                    ),
                  );
                },
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

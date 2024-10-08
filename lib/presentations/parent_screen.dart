import 'package:flutter/material.dart';
import 'package:howl_and_seek/application/authentication_service.dart';
import 'package:howl_and_seek/common_widgets/rounded_elevated_button.dart';
import 'package:howl_and_seek/presentations/home_screen.dart';
import 'package:howl_and_seek/presentations/ranks_screen.dart';
import 'package:howl_and_seek/utils/custom_icons.dart';
import 'package:howl_and_seek/utils/state_handlers.dart';

import '../common_widgets/bottom_appbar_widget.dart';
import '../domain/player_model.dart';
import '../utils/custom_colors.dart';

class ParentScreen extends StatefulWidget {
  final Player player;
  const ParentScreen({super.key, required this.player});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  PageStateHandler pageStateHandler = PageStateHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: CustomColors.lightBackground,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: pageStateHandler,
            builder: (context, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: pageStateHandler.currentPage == 0
                    ? HomeScreen(player: widget.player)
                    : pageStateHandler.currentPage == 1
                    ? RanksScreen(player: widget.player)
                    : pageStateHandler.currentPage == 2
                    ? const Placeholder()
                    : const Placeholder(),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Material(
                    elevation: 10,
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.primaryBackground,
                        boxShadow: [
                          BoxShadow(
                            color: CustomColors.primaryBackground.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          )
                        ],
                        borderRadius: const BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: CustomIcons.user(CustomColors.light),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(widget.player.name!, style: TextStyle(color: CustomColors.light, fontSize: 14, fontWeight: FontWeight.w500)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: RoundedElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  AuthenticationService.signOut();
                                  Navigator.of(context).maybePop();
                                },
                                backgroundColor: Colors.transparent,
                                overlayColor: CustomColors.secondaryAccent,
                                borderColor: CustomColors.secondaryAccent,
                                borderSide: BorderSide(color: CustomColors.secondaryAccent, width: 3),
                                height: 30,
                                child: Text("LOGOUT", style: TextStyle(color: CustomColors.secondaryAccent, fontSize: 12, fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(pageStateHandler: pageStateHandler),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:howl_and_seek/common_widgets/rounded_elevated_button.dart';
import 'package:howl_and_seek/presentations/home_screen.dart';
import 'package:howl_and_seek/presentations/ranks_screen.dart';
import 'package:howl_and_seek/utils/custom_icons.dart';
import 'package:howl_and_seek/utils/state_handlers.dart';

import '../common_widgets/bottom_appbar_widget.dart';
import '../utils/custom_colors.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

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
                colors: [
                  CustomColors.secondaryBackground.withOpacity(0.3),
                  CustomColors.primaryAccent.withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: pageStateHandler,
            builder: (context, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: pageStateHandler.currentPage == 0
                    ? const HomeScreen()
                    : pageStateHandler.currentPage == 1
                    ? const RanksScreen()
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
                Container(height: 50),
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
                        color: CustomColors.secondaryBackground,
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
                                child: Text("Juan de la cruz", style: TextStyle(color: CustomColors.light, fontSize: 14, fontWeight: FontWeight.w500)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 100,
                              child: RoundedElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: Colors.transparent,
                                overlayColor: CustomColors.secondaryAccent,
                                borderColor: CustomColors.secondaryAccent,
                                height: 30,
                                child: Text("LOGOUT", style: TextStyle(color: CustomColors.secondaryAccent, fontSize: 12, fontWeight: FontWeight.w400)),
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

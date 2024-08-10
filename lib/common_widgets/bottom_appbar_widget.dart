import 'package:flutter/material.dart';
import 'package:howl_and_seek/utils/custom_colors.dart';

import '../utils/custom_icons.dart';
import '../utils/state_handlers.dart';

class CustomBottomAppBar extends StatelessWidget {
  final PageStateHandler pageStateHandler;
  const CustomBottomAppBar({super.key, required this.pageStateHandler});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: CustomColors.secondaryBackground,
                border: Border(top: BorderSide(color: CustomColors.primaryAccent))
            ),
            height: 105,
          ),
          SizedBox(
            height: 105,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(0);
                  },
                  icon: SizedBox(
                    height: 67,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 2000),
                            child: pageStateHandler.currentPage == 0 ? CustomIcons.home(CustomColors.primaryAccent) : CustomIcons.home(CustomColors.light),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(1);
                  },
                  icon: Container(
                    height: 67,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 2, left: 4, right: 4),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 2000),
                            child: pageStateHandler.currentPage == 1 ? CustomIcons.ranks(CustomColors.primaryAccent) : CustomIcons.ranks(CustomColors.light),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    pageStateHandler.gotoPage(2);
                  },
                  icon: SizedBox(
                    height: 67,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimatedBuilder(
                        animation: pageStateHandler,
                        builder: (context, child) {
                          return pageStateHandler.currentPage == 2 ? CustomIcons.info(CustomColors.primaryAccent) : CustomIcons.info(CustomColors.light);
                        },
                      ),
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

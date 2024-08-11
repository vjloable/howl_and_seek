import 'package:flutter/material.dart';
import 'package:howl_and_seek/utils/custom_icons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../common_widgets/rounded_elevated_button.dart';
import '../../utils/custom_colors.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key,});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  MobileScannerController mobileScannerController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryBackground,
      body: Stack(
        children: [
          MobileScanner(
            controller: mobileScannerController,
            onDetect: (barcodes) {
              barcodes.barcodes.isNotEmpty ? print(barcodes.barcodes.first.displayValue) : print("");
            },
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: RoundedElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: Colors.transparent,
                          overlayColor: CustomColors.secondaryBackground,
                          borderColor: CustomColors.secondaryBackground,
                          borderSide: BorderSide(color: CustomColors.secondaryBackground),
                          height: 30,
                          child: Text("BACK", style: TextStyle(color: CustomColors.secondaryBackground, fontSize: 12, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 48,
                  child: Text("SEEK", style: TextStyle(color: CustomColors.primaryAccent, fontSize: 32, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 45),
                StreamBuilder(
                  stream: mobileScannerController.barcodes,
                  builder: (context, snapshot) {
                    final scannedBarcodes = snapshot.data?.barcodes ?? [];
                    return AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: scannedBarcodes.isEmpty ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.secondaryBackground.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(500),
                                ),
                                child: SizedBox(
                                  height: 500,
                                  width: 500,
                                  child: CircularProgressIndicator(
                                    color: CustomColors.light,
                                    strokeWidth: 20,
                                    value: null,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: CustomIcons.paws(CustomColors.light),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : snapshot.data!.barcodes.length <= 5 ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.secondaryBackground.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(500),
                                ),
                                child: SizedBox(
                                  height: 500,
                                  width: 500,
                                  child: CircularProgressIndicator(
                                    color: CustomColors.error,
                                    strokeWidth: 20,
                                    value: null,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: CustomIcons.paws(CustomColors.error),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: SizedBox(
                            height: 500,
                            width: 500,
                            child: ElevatedButton(
                              onPressed: () {}, // icon of the button
                              style: ElevatedButton.styleFrom( // styling the button
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                fixedSize: const Size(500, 500),
                                backgroundColor: CustomColors.secondaryBackground,
                                foregroundColor: CustomColors.primaryAccent,
                                side: BorderSide(color: CustomColors.primaryAccent, width: 20),
                              ),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: CustomIcons.paws(CustomColors.primaryAccent),
                                ),
                              ),
                            ),
                            // child: RoundedElevatedButton(
                            //   backgroundColor: CustomColors.secondaryBackground,
                            //   onPressed: () {
                            //     print("object");
                            //   },
                            //   overlayColor: CustomColors.primaryAccent,
                            //   borderColor: CustomColors.primaryAccent,
                            //   borderSide: BorderSide(color: CustomColors.primaryAccent, width: 20),
                            //   child:
                            // ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
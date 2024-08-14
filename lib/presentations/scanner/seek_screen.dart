import 'package:flutter/material.dart';
import 'package:howl_and_seek/presentations/scanner/qrchecker_screen.dart';
import 'package:howl_and_seek/utils/custom_icons.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../common_widgets/rounded_elevated_button.dart';
import '../../domain/player_model.dart';
import '../../utils/custom_colors.dart';

class SeekScreen extends StatefulWidget {
  final Player player;
  const SeekScreen({super.key, required this.player,});

  @override
  State<SeekScreen> createState() => _SeekScreenState();
}

class _SeekScreenState extends State<SeekScreen> {
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
                const SizedBox(height: 20),
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
                                  height: 300,
                                  width: 300,
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
                      ) : scannedBarcodes.first.rawValue!.length <= 5 ? FittedBox(
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
                                  height: 300,
                                  width: 300,
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
                            height: 300,
                            width: 300,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PositiveScreen()));
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRCheckerScreen(code: scannedBarcodes.first.rawValue!, player: widget.player,)));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                                fixedSize: const Size(300, 300),
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
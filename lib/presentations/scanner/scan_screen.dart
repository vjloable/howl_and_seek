import 'package:flutter/material.dart';
import 'package:howl_and_seek/utils/graphics.dart';
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
      backgroundColor: CustomColors.primaryBackground,
      body: Stack(
        children: [
          MobileScanner(
            controller: mobileScannerController,
            onDetect: (barcodes) {
              barcodes.barcodes.isNotEmpty ? print(barcodes.barcodes.first.displayValue) : print("");
            },
            placeholderBuilder: (p0, p1) {
              return Expanded(child: Illustration.backgroundGlow);
            },
          ),
          Column(
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
                        overlayColor: CustomColors.light,
                        borderColor: CustomColors.light,
                        height: 30,
                        child: Text("BACK", style: TextStyle(color: CustomColors.light, fontSize: 12, fontWeight: FontWeight.w400)),
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
                    child: scannedBarcodes.isEmpty ? SizedBox(
                      height: 275,
                      width: 275,
                      child: Flexible(
                        child: CircularProgressIndicator(
                          color: CustomColors.light,
                          strokeWidth: 10,
                          value: null,
                        ),
                      ),
                    ) : SizedBox(
                      height: 275,
                      width: 275,
                      child: Flexible(
                        child: CircularProgressIndicator(
                          color: CustomColors.primaryAccent,
                          strokeWidth: 10,
                          value: 1,
                        ),
                      ),
                    ),
                  );
                  if (scannedBarcodes.isEmpty) {
                    return SizedBox(
                      height: 275,
                      width: 275,
                      child: Flexible(
                        child: CircularProgressIndicator(
                          color: CustomColors.light,
                          strokeWidth: 10,
                          value: null,
                        ),
                      ),
                    );
                    // return const RoundedElevatedButton(
                    //   backgroundColor: Color(0xFFFFFFFF),
                    //   onPressed: null,
                    //   borderColor: Color(0xFF6590FF),
                    //   child: Text("CAPTURING", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
                    // );
                  } else {
                    return SizedBox(
                      height: 275,
                      width: 275,
                      child: Flexible(
                        child: CircularProgressIndicator(
                          color: CustomColors.primaryAccent,
                          strokeWidth: 10,
                          value: 1,
                        ),
                      ),
                    );
                    // if (scannedBarcodes.first.displayValue!.length < 28) {
                    //   return RoundedElevatedButton(
                    //     backgroundColor: const Color(0xFFFFFFFF),
                    //     onPressed: null,
                    //     child: Text(scannedBarcodes.first.displayValue!, style: const TextStyle(color: Color(0xFF515151), fontSize: 14, fontWeight: FontWeight.w700)),
                    //   );
                    // }
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
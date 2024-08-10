import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatefulWidget {
  final Function()? onPressed;
  final Color backgroundColor;
  final Color? borderColor;
  final Color overlayColor;
  final double height;
  final Widget? child;
  final BorderSide? borderSide;
  const RoundedElevatedButton({super.key, this.onPressed, required this.backgroundColor, this.borderColor, this.height = 70, this.child, this.overlayColor = Colors.white, this.borderSide});

  @override
  State<RoundedElevatedButton> createState() => _RoundedElevatedButtonState();
}

class _RoundedElevatedButtonState extends State<RoundedElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: widget.borderColor ?? Colors.transparent),
      ),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            minimumSize: Size(double.infinity, widget.height),
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: widget.borderSide ?? const BorderSide(),
            ),
            overlayColor: widget.overlayColor,
          ),
          child: widget.child ?? const SizedBox()
      ),
    );
  }
}

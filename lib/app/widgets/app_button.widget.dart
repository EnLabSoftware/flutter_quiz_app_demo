import 'package:flutter/material.dart';
import 'package:quiz_demo/app/constant.dart';

final borderRadius = BorderRadius.circular(12);

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
    this.padding,
    this.gradient = kPrimaryGradient,
    this.width,
    this.height,
  }) : super(key: key);

  final String labelText;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          backgroundColor: kButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          labelText,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

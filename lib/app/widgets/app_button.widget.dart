import 'package:flutter/material.dart';
import 'package:quiz_demo/app/constant.dart';

final borderRadius = BorderRadius.circular(12);

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
    this.padding,
    this.width,
    this.height,
    this.backgroundColor,
  }) : super(key: key);

  final String labelText;
  final Function() onPressed;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? backgroundColor;

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
          backgroundColor: backgroundColor ?? kPrimaryButtonColor,
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

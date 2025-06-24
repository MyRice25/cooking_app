import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double imageSize;
  final double textSize;
  final double spacing;

  const AppLogo({
    Key? key,
    this.imageSize = 300,
    this.textSize = 48,
    required this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo_cooking.png',
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

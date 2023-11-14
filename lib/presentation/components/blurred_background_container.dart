import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackgroundContainer extends StatelessWidget {
  const BlurredBackgroundContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}

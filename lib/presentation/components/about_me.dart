import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../providers/color_provider.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    super.key,
    this.isPopup = false,
  });

  final bool isPopup;

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: !widget.isPopup
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.5,
          minHeight: !widget.isPopup
              ? MediaQuery.of(context).size.height * 0.2
              : MediaQuery.of(context).size.height * 0.5,
          minWidth: !widget.isPopup
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Hello, World!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Animate(
              autoPlay: true,
              onComplete: (AnimationController controller) {
                controller.repeat(
                  reverse: true,
                );
              },
              effects: [
                const FadeEffect(
                  duration: Duration(seconds: 1),
                ),
                ShimmerEffect(
                  duration: const Duration(seconds: 2),
                  delay: const Duration(seconds: 1),
                  color: context.watch<ColorProvider>().color,
                ),
              ],
              child: const Text(
                "I am Manan Gandhi, a Computer Engineering Student who loves to code and build software.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    this.isPopup = false,
  });

  final bool isPopup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: !isPopup
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.5,

          minHeight: !isPopup
              ? MediaQuery.of(context).size.height * 0.2
              : MediaQuery.of(context).size.height * 0.5,
          minWidth: !isPopup
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
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText(
                  "I am Manan Gandhi, a Computer Engineering Student who loves to code and build software.",
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  duration: const Duration(seconds: 5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

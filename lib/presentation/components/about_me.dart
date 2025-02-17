import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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
            Shimmer.fromColors(
              baseColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              highlightColor: context.watch<ColorProvider>().color,
              period: const Duration(milliseconds: 2500),
              child: Text(
                "I am Manan Gandhi, a Computer Engineering Student who loves to code and build software. I have participated in 15+ hackathons and won 3 hackathons (2 - runner up, 1 - winner)",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
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

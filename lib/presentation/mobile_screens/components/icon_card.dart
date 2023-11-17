import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../providers/color_provider.dart';

class IconCard extends StatefulWidget {
  const IconCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      autoPlay: true,
      onComplete: (AnimationController controller) {
        controller.repeat();
      },
      effects: const [
        ShimmerEffect(
          duration: Duration(seconds: 2),
        ),
      ],
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: context.watch<ColorProvider>().color,
                  child: Center(
                    child: Icon(
                      widget.icon,
                      size: 50,
                      color: context
                                  .read<ColorProvider>()
                                  .color
                                  .computeLuminance() >
                              0.5
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

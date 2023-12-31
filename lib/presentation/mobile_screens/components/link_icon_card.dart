import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/color_provider.dart';

class LinkIconCard extends StatefulWidget {
  const LinkIconCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  State<LinkIconCard> createState() => _LinkIconCardState();
}

class _LinkIconCardState extends State<LinkIconCard> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
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
                child: Icon(
                  widget.icon,
                  size: 50,
                  color:
                      context.read<ColorProvider>().color.computeLuminance() >
                              0.5
                          ? Colors.black
                          : Colors.white,
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
                color:
                    context.read<ColorProvider>().color.computeLuminance() >
                            0.5
                        ? Colors.black
                        : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

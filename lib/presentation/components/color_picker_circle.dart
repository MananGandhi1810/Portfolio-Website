import 'package:flutter/material.dart';

class ColorPickerCircle extends StatelessWidget {
  const ColorPickerCircle({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });

  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              if (isSelected)
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

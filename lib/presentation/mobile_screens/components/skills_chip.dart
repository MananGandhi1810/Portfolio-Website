import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/color_provider.dart';

class SkillsChip extends StatefulWidget {
  const SkillsChip({super.key, required this.skillName, required this.icon});

  final String skillName;
  final IconData icon;

  @override
  State<SkillsChip> createState() => _SkillsChipState();
}

class _SkillsChipState extends State<SkillsChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(
        color: Provider.of<ColorProvider>(context).color.withOpacity(0.5),
        width: 1,
      ),
      label: Text(
        widget.skillName,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      avatar: Icon(
        widget.icon,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
        color: Colors.white,
      ),
    );
  }
}

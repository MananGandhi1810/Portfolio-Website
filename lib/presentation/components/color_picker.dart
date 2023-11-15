import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/components/color_picker_circle.dart';
import 'package:provider/provider.dart';

import '../../providers/color_provider.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, this.isPopup = false});

  final bool isPopup;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: !widget.isPopup
              ? MediaQuery.of(context).size.width * 0.2
              : MediaQuery.of(context).size.width * 0.5,
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          shrinkWrap: true,
          children: [
            ColorPickerCircle(
              color: Colors.red,
              onTap: () {
                debugPrint("Red");
                setState(() {
                  context.read<ColorProvider>().setColor(Colors.red);
                });
              },
              isSelected: context.watch<ColorProvider>().color == Colors.red,
            ),
            ColorPickerCircle(
              color: Colors.blue,
              onTap: () {
                debugPrint("Blue");
                setState(() {
                  context.read<ColorProvider>().setColor(Colors.blue);
                });
              },
              isSelected: context.watch<ColorProvider>().color == Colors.blue,
            ),
            ColorPickerCircle(
              color: Colors.green,
              onTap: () {
                debugPrint("Green");
                setState(() {
                  context.read<ColorProvider>().setColor(Colors.green);
                });
              },
              isSelected: context.watch<ColorProvider>().color == Colors.green,
            ),
            ColorPickerCircle(
              color: Colors.yellow,
              onTap: () {
                debugPrint("Yellow");
                setState(() {
                  context.read<ColorProvider>().setColor(Colors.yellow);
                });
              },
              isSelected: context.watch<ColorProvider>().color == Colors.yellow,
            ),
            ColorPickerCircle(
              color: Colors.purple,
              onTap: () {
                debugPrint("Purple");
                setState(() {
                  context.read<ColorProvider>().setColor(Colors.purple);
                });
              },
              isSelected: context.watch<ColorProvider>().color == Colors.purple,
            ),
            ColorPickerCircle(
              color: Colors.brown,
              onTap: () {
                debugPrint("brown");
                setState(() {
                  context.read<ColorProvider>().setColor(Colors.brown);
                });
              },
              isSelected: context.watch<ColorProvider>().color == Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}

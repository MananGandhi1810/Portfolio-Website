import 'package:flutter/material.dart';

import 'blurred_background_container.dart';

class BlurredBackgroundPopup extends StatelessWidget {
  const BlurredBackgroundPopup({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: BlurredBackgroundContainer(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: BlurredBackgroundContainer(
                    child: child,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

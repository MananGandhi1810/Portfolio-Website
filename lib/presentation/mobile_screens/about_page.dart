import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/color_provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: context.watch<ColorProvider>().color.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'About Me',
          style: TextStyle(
            color: context.watch<ColorProvider>().color.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: context.watch<ColorProvider>().color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/manangandhi.jpeg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Manan Gandhi',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I am a ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "18 year old Web and Mobile Development Enthusiast",
                      style: TextStyle(
                        fontSize: 20,
                        color: context.watch<ColorProvider>().color,
                      ),
                    ),
                    TextSpan(
                      text: ', pursuing ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "B.Tech in Computer Engineering",
                      style: TextStyle(
                        fontSize: 20,
                        color: context.watch<ColorProvider>().color,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' at Mukesh Patel School of Technology Management and Engineering, Mumbai.',
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
            ],
          ),
        ),
      ),
    );
  }
}

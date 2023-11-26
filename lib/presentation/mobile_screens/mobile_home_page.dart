import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/mobile_screens/components/icon_card.dart';
import 'package:portfolio_website/presentation/mobile_screens/projects_page.dart';
import 'package:portfolio_website/presentation/mobile_screens/skills_page.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/color_provider.dart';
import 'about_page.dart';
import 'education_page.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key, this.color = Colors.blue});

  final Color color;

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Tween<double>? _tween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _tween = Tween<double>(begin: 0, end: 1);
    _tween!.animate(_animationController!).addListener(() {
      setState(() {});
    });
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.forward(from: 0);
      }
    });
    _animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<ColorProvider>().color != widget.color) {
      Future.delayed(const Duration(milliseconds: 100), () {
        context.read<ColorProvider>().setColor(widget.color);
      });
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.watch<ColorProvider>().color.withOpacity(
                    ((sin(2 * pi * _tween!.evaluate(_animationController!)) / 2)
                                .abs() %
                            0.5) +
                        0.25,
                  ),
              context.watch<ColorProvider>().color.withOpacity(
                    ((sin(2 * pi * _tween!.evaluate(_animationController!)) / 2)
                                .abs() %
                            0.5) +
                        0.5,
                  ),
              context.watch<ColorProvider>().color.withOpacity(
                    ((sin(2 * pi * _tween!.evaluate(_animationController!)) / 2)
                                .abs() %
                            0.5) +
                        0.25,
                  ),
            ],
            transform: GradientRotation(
              2 * pi * _tween!.evaluate(_animationController!),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "About",
                        icon: Icons.person,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Projects",
                        icon: Icons.code,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProjectsPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Skills",
                        icon: Icons.star,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SkillsPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Education",
                        icon: Icons.school,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EducationPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Github",
                        icon: SimpleIcons.github,
                        onTap: () {
                          launchUrl(
                            Uri.parse("https://github.com/MananGandhi1810/"),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Email",
                        icon: Icons.mail,
                        onTap: () {
                          launchUrl(
                            Uri.parse("mailto:ardumanan@gmail.com"),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Instagram",
                        icon: SimpleIcons.instagram,
                        onTap: () {
                          launchUrl(
                            Uri.parse(
                                "https://www.instagram.com/manangandhi.tech/"),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconCard(
                        title: "Blog",
                        icon: Icons.article,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Coming Soon!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: context
                                              .read<ColorProvider>()
                                              .color
                                              .computeLuminance() >
                                          0.5
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor:
                                  context.read<ColorProvider>().color,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(
                        Uri.parse(
                            "https://github.com/MananGandhi1810/Portfolio-Website"),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Developed by ",
                            style: TextStyle(
                              fontSize: 20,
                              color: context
                                          .read<ColorProvider>()
                                          .color
                                          .computeLuminance() >
                                      0.5
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Manan Gandhi ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: context
                                          .read<ColorProvider>()
                                          .color
                                          .computeLuminance() >
                                      0.5
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Icon(
                                Icons.open_in_new,
                                size: 20,
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
                        ],
                      ),
                    ),
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

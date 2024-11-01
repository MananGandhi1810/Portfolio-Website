import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/color_provider.dart';
import 'contact_form_page.dart';
import 'about_page.dart';
import 'components/app_icon_card.dart';
import 'components/link_icon_card.dart';
import 'education_page.dart';
import 'projects_page.dart';
import 'skills_page.dart';

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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppIconCard(
                        title: "About",
                        icon: Icons.person,
                        onTap: AboutPage(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppIconCard(
                        title: "Projects",
                        icon: Icons.code,
                        onTap: ProjectsPage(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppIconCard(
                        title: "Skills",
                        icon: Icons.star,
                        onTap: SkillsPage(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppIconCard(
                        title: "Education",
                        icon: Icons.school,
                        onTap: EducationPage(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppIconCard(
                        title: "Contact",
                        icon: Icons.message,
                        onTap: ContactFormPage(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinkIconCard(
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
                      child: LinkIconCard(
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
                      child: LinkIconCard(
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
                      child: LinkIconCard(
                        title: "Blog",
                        icon: Icons.article,
                        onTap: () {
                          launchUrl(
                            Uri.parse("https://blog.manangandhi.tech/"),
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

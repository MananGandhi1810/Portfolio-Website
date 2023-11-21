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

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<ColorProvider>().color != widget.color) {
      Future.delayed(const Duration(milliseconds: 100), () {
        context.read<ColorProvider>().setColor(widget.color);
      });
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                            Uri.parse("https://www.instagram.com/manan.py"),
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
                              backgroundColor: context.read<ColorProvider>().color,
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
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Built by ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Manan Gandhi",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: " using ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Flutter",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(6),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(
                            Uri.parse("https://pawan.app"),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Inspired by ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "Pawan Kumar's Website",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4),
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

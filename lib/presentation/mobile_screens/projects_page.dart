import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/color_provider.dart';
import 'components/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
          'Projects',
          style: TextStyle(
            color: context.watch<ColorProvider>().color.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: context.watch<ColorProvider>().color,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProjectCard(
              projectName: 'SKVJUM: A Community App',
              projectImage: 'assets/images/projects/skvjum_app.png',
              projectDescription:
                  'A community app for the members of Shree Khambhat Vishashrimali Jain Upnagar Mandal.',
              projectLink:
                  'https://play.google.com/store/apps/details?id=com.skvjum.skvjum_app',
              projectTechnologies: [
                'Flutter',
                'Flask',
                'MongoDB',
                'AWS',
              ],
            ),
            ProjectCard(
              projectName: "Conversify",
              projectImage: "assets/images/projects/conversify_app.png",
              projectDescription:
                  "An app to help people discover other people of different domains to build exciting projects (built during a 24 hour hackathon).",
              projectLink:
                  "https://github.com/MananGandhi1810/Verbal-Virtuosos-Debate-a-thon",
              projectTechnologies: [
                "Flutter",
                "Firebase",
              ],
            ),
            ProjectCard(
              projectName: 'MPSTME OnTrack',
              projectImage: 'assets/images/projects/mpstme_ontrack_app.png',
              projectDescription:
                  'MPSTME OnTrack is built with an aim of never letting anyone from MPSTME get late to a lecture searching for their class. MPSTME OnTrack allows a user to store their schedule with their class details.',
              projectLink:
                  'https://appdev-gdsc-mpstme.github.io/MPSTME_OnTrack/',
              projectTechnologies: [
                'Flutter',
              ],
            ),
            ProjectCard(
              projectName: 'Save Birds',
              projectImage: 'assets/images/projects/save_birds_app.png',
              projectDescription:
                  'A suite of apps for the Save Birds NGO which rescues and treats injured birds.',
              projectLink:
                  'https://play.google.com/store/search?q=pub%3ASave%20Birds&c=apps',
              projectTechnologies: [
                'Flutter',
                'Firebase',
              ],
            ),
            ProjectCard(
              projectName: 'DockerSensei',
              projectImage: 'assets/images/projects/docker_sensei_app.jpeg',
              projectDescription:
                  'A docker container management system, which helps in managing and monitoring the docker containers running on multiple server. Built during HackNiche, a 24 hour hackathon held at DJSCE.',
              projectLink: 'https://github.com/MananGandhi1810/hackniche-2024',
              projectTechnologies: [
                'Node.js',
                'Flutter',
                'Docker',
                'Pusher',
                'Next.js',
                'Express.js',
                'PostgreSQL',
                'Google Cloud Platform',
              ],
            ),
            ProjectCard(
              projectName: 'Stock Market Game',
              projectImage: 'assets/images/projects/stock_market_app.png',
              projectDescription:
                  'A realtime online multiplayer game, where the stock market can be simulated.',
              projectLink: 'https://github.com/MananGandhi1810/StockMarketGame',
              projectTechnologies: [
                'Flutter',
                'Node.js',
                'Socket.io',
                'Express.js',
              ],
            ),
            ProjectCard(
              projectName: "ElectricVehicles Website",
              projectImage:
                  "assets/images/projects/electric_vehicles_website.png",
              projectDescription:
                  "A website that helps people to make informed decisions on buying electric vehicles.",
              projectLink:
                  "https://github.com/MananGandhi1810/FooBar-Electric-Vehicle-CyberCypher-Hackathon",
              projectTechnologies: [
                "Python",
                "Flask",
                "HTML",
                "CSS",
                "JavaScript",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
              projectName: 'MPSTME OnTrack',
              projectImage: 'assets/images/projects/mpstme_ontrack_app.png',
              projectDescription:
                  'MPSTME OnTrack is built with an aim of never letting anyone from MPSTME get late to a lecture searching for their class. MPSTME OnTrack allows a user to store their schedule with their class details. Currently has 1400+ downloads on Play Store and App Store combined.',
              projectLink: 'https://ontrack.gdscmpstme.com/',
              projectTechnologies: [
                'Flutter',
                'Google Play Store',
                'Apple App Store',
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
              projectName: 'LeetCode Clone',
              projectImage: 'assets/images/projects/leetcode_clone_website.png',
              projectDescription:
                  'A platform to practice logic based programming questions. Currently supprts 4 languages - Python, Java, C and C++.',
              projectLink: 'https://code.manangandhi.tech/',
              projectTechnologies: [
                'Express.js',
                'React.js',
                'PostgreSQL',
                'Redis',
                'Docker',
                'Prisma ORM',
                'Shadcn/UI',
                'Azure',
                'Cloudflare Workers AI'
              ],
            ),
            ProjectCard(
              projectName: 'Chess',
              projectImage: 'assets/images/projects/chess_app.jpg',
              projectDescription:
                  'A scalable chess game, which can be played by multiple users at the same time.',
              projectLink: 'https://chess.manangandhi.tech/',
              projectTechnologies: [
                'Flutter',
                'Express.js',
                'Socket.io',
                'PostgreSQL',
                'Redis',
                'Docker',
                'Prisma ORM',
                'Azure',
              ],
            ),
            ProjectCard(
              projectName: 'BrainyBox',
              projectImage: 'assets/images/projects/brainybox_app.png',
              projectDescription:
                  'An edutainment platform, which helps students learn new concepts in a fun and interactive way. 1st runner up at IET Hack n Code, held at MPSTME, Mumbai.',
              projectLink:
                  'https://github.com/MananGandhi1810/BinaryBandits-HnC-2024',
              projectTechnologies: [
                'Express.js',
                'Flutter',
                'Docker',
                'Firebase',
                'Google Maps API',
              ],
            ),
            ProjectCard(
              projectName: "Cloudflare AI Dart",
              projectImage: "assets/images/projects/cloudflare_ai_library.png",
              projectDescription:
                  "cloudflare_ai is a dart library for using the Cloudflare Workers AI, to perform multiple AI based operations.",
              projectLink: "https://pub.dev/packages/cloudflare_ai",
              projectTechnologies: [
                "Dart",
                "Cloudflare",
              ],
            ),
            ProjectCard(
              projectName: "Conversify",
              projectImage: "assets/images/projects/conversify_app.png",
              projectDescription:
                  "An app to help people discover other people of different domains to build exciting projects (built during a 24 hour hackathon). 1st runner up at Tark Debate-a-Thon held at MPSTME, Mumbai",
              projectLink:
                  "https://github.com/MananGandhi1810/Verbal-Virtuosos-Debate-a-thon",
              projectTechnologies: [
                "Flutter",
                "Firebase",
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

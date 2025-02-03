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
                'Google Play Store',
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
              projectName: 'LeetCode Clone',
              projectImage: 'assets/images/projects/leetcode_clone_website.png',
              projectDescription:
                  'A platform to practice logic based programming questions. Currently supprts 4 languages - Python, Java, C and C++.',
              projectLink: 'https://code.mpst.me/',
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
              projectName: 'FluxGate',
              projectImage: 'assets/images/projects/fluxgate_website.jpg',
              projectDescription:
                  'Fluxgate is a self-hostable deployment platform that empowers developers to effortlessly deploy their GitHub repositories to self-hosted servers, with an option to deploy using natural language. Winner for best use of Gemini API at HackThisFall Virtual 2024',
              projectLink: 'https://github.com/MananGandhi1810/FluxGate',
              projectTechnologies: [
                'Express.js',
                'Next.js',
                'Docker',
                'PostgreSQL',
                'Prisma ORM',
                'Redis',
                'Gemini 1.5 Flash',
                'Shadcn/UI',
              ],
            ),
            ProjectCard(
              projectName: 'Automated Interview Platform',
              projectImage: 'assets/images/projects/aip_website.jpg',
              projectDescription:
                  'An interview simulation platform, which can give users feedback and points to improve for a real interview. Built for Smart India Hackathon 2024',
              projectLink:
                  'https://github.com/MananGandhi1810/Vichaar-Manthan-SIH-2024',
              projectTechnologies: [
                'Express.js',
                'Next.js',
                'MongoDB',
                'Gemini 1.5 Flash',
                'Python',
                'Apache Kafka',
                'Redis',
                'Docker',
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
              projectName: 'YetiCode',
              projectImage: 'assets/images/projects/yeticode_website.jpeg',
              projectDescription:
                  'YetiCode is a web application designed to significantly reduce development time and the number of bugs in your projects. Winner at Datathon 3.0 by Analytika MPSTME.',
              projectLink:
                  'https://github.com/MananGandhi1810/datathon-round-2',
              projectTechnologies: [
                'Next.js',
                'TailwindCSS',
                'Express.js',
                'Flask',
                'GitHub API',
                'Gemini 2.0 Flash',
                'PostgreSQL',
                'Prisma ORM',
                'Resend API',
                'Docker',
              ],
            ),
            ProjectCard(
              projectName: 'AdGen',
              projectImage: 'assets/images/projects/adgen_website.jpeg',
              projectDescription:
                  'Adgen is your all-in-one platform to gather competitive intelligence, analyze market positioning, and track social sentiment across multiple channels—all in one place. Built at Level Supermind Hackathon.',
              projectLink:
                  'https://github.com/MananGandhi1810/level-supermind-hackathon-2025',
              projectTechnologies: [
                'Next.js',
                'FastAPI',
                'LangChain',
                'AstraDB',
                'FireCrawl',
                'SerpAPI',
                'YouTube Comments API',
                'YT-dlp',
                'Auth0',
                'Gemini 2.0 Flash',
                'Reddit API',
                'Docker',
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
              projectLink: 'https://github.com/rushabhhere/hackniche',
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

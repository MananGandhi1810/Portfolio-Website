import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/color_provider.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.projectName,
    required this.projectImage,
    required this.projectDescription,
    required this.projectLink,
    required this.projectTechnologies,
  });

  final String projectName;
  final String projectImage;
  final String projectDescription;
  final String projectLink;
  final List<String> projectTechnologies;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {
            launchUrl(Uri.parse(widget.projectLink));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage(widget.projectImage),
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.fitHeight,
                ),
                ListTile(
                  title: Text(
                    widget.projectName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: widget.projectDescription,
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).brightness ==
                                    Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            fontFamily: GoogleFonts.rubik().fontFamily,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          for (var technology in widget.projectTechnologies)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Chip(
                                side: BorderSide(
                                  color: Provider.of<ColorProvider>(context).color.withOpacity(0.5),
                                  width: 1,
                                ),
                                label: Text(
                                  technology,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
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

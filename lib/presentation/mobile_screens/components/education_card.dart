import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EducationCard extends StatelessWidget {
  const EducationCard(
      {super.key,
      required this.title,
      required this.instituteName,
      required this.duration,
      required this.url});

  final String title;
  final String instituteName;
  final String duration;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse(url));
        },
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                instituteName,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                duration,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

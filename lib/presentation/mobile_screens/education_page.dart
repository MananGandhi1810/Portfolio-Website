import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/mobile_screens/components/education_card.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.school,
                size: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
            const EducationCard(
              title: "Pursuing B.Tech in Computer Engineering",
              instituteName:
                  "Mukesh Patel School of Technology Management and Engineering",
              duration: "2022 - 2028",
              url: "https://engineering.nmims.edu/",
            ),
            const EducationCard(
              title: "ICSE",
              instituteName: "Kapol Vidyanidhi International School",
              duration: "2010 - 2022",
              url: "https://www.kapolvidyanidhi.in/landing.aspx",
            ),
          ],
        ),
      ),
    );
  }
}

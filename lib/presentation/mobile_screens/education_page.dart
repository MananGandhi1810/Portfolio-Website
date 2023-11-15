import 'package:flutter/material.dart';
import 'package:portfolio_website/presentation/mobile_screens/components/education_card.dart';

import 'package:provider/provider.dart';

import '../../providers/color_provider.dart';

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
        iconTheme: IconThemeData(
          color: context.watch<ColorProvider>().color.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Education',
          style: TextStyle(
            color: context.watch<ColorProvider>().color.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: context.watch<ColorProvider>().color,
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

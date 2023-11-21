import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../providers/color_provider.dart';
import 'components/divider_with_text.dart';
import 'components/skills_chip.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  List<Map<String, dynamic>> languages = [];
  List<Map<String, dynamic>> librariesAndFrameworks = [];
  List<Map<String, dynamic>> tools = [];

  void initSkills() {
    setState(() {
      languages = [
        {
          "skillName": "C",
          "icon": SimpleIcons.c,
        },
        {
          "skillName": "C++",
          "icon": SimpleIcons.cplusplus,
        },
        {
          "skillName": "Python",
          "icon": SimpleIcons.python,
        },
        {
          "skillName": "Dart",
          "icon": SimpleIcons.dart,
        },
        {
          "skillName": "Kotlin",
          "icon": SimpleIcons.kotlin,
        },
        {
          "skillName": "Javascript",
          "icon": SimpleIcons.javascript,
        },
        {
          "skillName": "Bash",
          "icon": SimpleIcons.gnubash,
        },
      ];

      librariesAndFrameworks = [
        {
          "skillName": "Flutter",
          "icon": SimpleIcons.flutter,
        },
        {
          "skillName": "Django",
          "icon": SimpleIcons.django,
        },
        {
          "skillName": "Flask",
          "icon": SimpleIcons.flask,
        },
        {
          "skillName": "FastAPI",
          "icon": SimpleIcons.fastapi,
        },
        {
          "skillName": "Node.js",
          "icon": SimpleIcons.nodedotjs,
        },
        {
          "skillName": "Express.js",
          "icon": SimpleIcons.express,
        },
        {
          "skillName": "React.js",
          "icon": SimpleIcons.react,
        },
        {
          "skillName": "React Native",
          "icon": SimpleIcons.react,
        },
        {
          "skillName": "Next.js",
          "icon": SimpleIcons.nextdotjs,
        },
        {
          "skillName": "Arduino",
          "icon": SimpleIcons.arduino,
        },
        {
          "skillName": "Pandas",
          "icon": SimpleIcons.pandas,
        },
        {
          "skillName": "Numpy",
          "icon": SimpleIcons.numpy,
        },
        {
          "skillName": "Scikit-Learn",
          "icon": SimpleIcons.scikitlearn,
        },
        {
          "skillName": "Jetpack Compose",
          "icon": SimpleIcons.jetpackcompose,
        },
        {
          "skillName": "OpenCV",
          "icon": SimpleIcons.opencv,
        },
        {
          "skillName": "Bootstrap",
          "icon": SimpleIcons.bootstrap,
        },
        {
          "skillName": "TailwindCSS",
          "icon": SimpleIcons.tailwindcss,
        },
      ];

      tools = [
        {
          "skillName": "VSCode",
          "icon": SimpleIcons.visualstudiocode,
        },
        {
          "skillName": "Android Studio",
          "icon": SimpleIcons.androidstudio,
        },
        {
          "skillName": "Windows",
          "icon": SimpleIcons.windows,
        },
        {
          "skillName": "Pop!_OS",
          "icon": SimpleIcons.popos,
        },
        {
          "skillName": "Ubuntu",
          "icon": SimpleIcons.ubuntu,
        },
        {
          "skillName": "Raspberry Pi",
          "icon": SimpleIcons.raspberrypi,
        },
        {
          "skillName": "Postman",
          "icon": SimpleIcons.postman,
        },
        {
          "skillName": "Git",
          "icon": SimpleIcons.git,
        },
        {
          "skillName": "GitHub",
          "icon": SimpleIcons.github,
        },
        {
          "skillName": "GitHub Actions",
          "icon": SimpleIcons.githubactions,
        },
        {
          "skillName": "MongoDB",
          "icon": SimpleIcons.mongodb,
        },
        {
          "skillName": "Google Colab",
          "icon": SimpleIcons.googlecolab,
        },
        {
          "skillName": "Jupyter",
          "icon": SimpleIcons.jupyter,
        },
        {
          "skillName": "AWS",
          "icon": SimpleIcons.amazonaws,
        },
        {
          "skillName": "Azure",
          "icon": SimpleIcons.azuredevops,
        },
        {
          "skillName": "Firebase",
          "icon": SimpleIcons.firebase,
        },
        {
          "skillName": "Supabase",
          "icon": SimpleIcons.supabase,
        },
        {
          "skillName": "Appwrite",
          "icon": SimpleIcons.appwrite,
        },
        {
          "skillName": "Figma",
          "icon": SimpleIcons.figma,
        },
        {
          "skillName": "Adobe Photoshop",
          "icon": SimpleIcons.adobephotoshop,
        },
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    initSkills();
  }

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
          'Skills',
          style: TextStyle(
            color: context.watch<ColorProvider>().color.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: context.watch<ColorProvider>().color,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DividerWithText(text: "Languages"),
              ),
              for (int i = 0; i < languages.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: SkillsChip(
                    skillName: languages[i]["skillName"],
                    icon: languages[i]["icon"],
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DividerWithText(text: "Libraries/Frameworks"),
              ),
              for (int i = 0; i < librariesAndFrameworks.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: SkillsChip(
                    skillName: librariesAndFrameworks[i]["skillName"],
                    icon: librariesAndFrameworks[i]["icon"],
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: DividerWithText(text: "Tools"),
              ),
              for (int i = 0; i < tools.length; i++)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: SkillsChip(
                    skillName: tools[i]["skillName"],
                    icon: tools[i]["icon"],
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

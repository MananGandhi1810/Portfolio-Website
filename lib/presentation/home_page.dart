import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/presentation/components/about_me.dart';
import 'package:portfolio_website/presentation/components/blurred_background_popup.dart';
import 'package:provider/provider.dart';

import '../providers/color_provider.dart';
import 'components/blurred_background_container.dart';
import 'components/color_picker.dart';
import 'mobile_screens/mobile_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AnimationController _controller;
  bool isSmallScreen = false;
  Color color = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      MediaQuery.of(context).size.width < 1024
          ? isSmallScreen = true
          : isSmallScreen = false;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.watch<ColorProvider>().color.withOpacity(0.5),
                  context.watch<ColorProvider>().color.withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !isSmallScreen
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const BlurredBackgroundContainer(
                              child: AboutMe(),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.blue,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const BlurredBackgroundPopup(
                                      child: AboutMe(
                                        isPopup: true,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text("About Me"),
                            ),
                          ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.35,
                      ),
                      child: DeviceFrame(
                        isFrameVisible: true,
                        device: Devices.android.onePlus8Pro,
                        screen: MaterialApp(
                          title: 'Manan Gandhi',
                          theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                              seedColor: Colors.blue,
                              brightness: Brightness.dark,
                            ),
                            useMaterial3: true,
                            textTheme: GoogleFonts.rubikTextTheme(),
                          ),
                          debugShowCheckedModeBanner: false,
                          home: const MobileHomePage(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !isSmallScreen
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const BlurredBackgroundContainer(
                              child: ColorPicker(),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.blue,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const BlurredBackgroundPopup(
                                      child: ColorPicker(
                                        isPopup: true,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text("Change Color"),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

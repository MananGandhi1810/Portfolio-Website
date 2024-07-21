import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:starsview/config/StarsConfig.dart';
import 'package:starsview/starsview.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/color_provider.dart';
import 'components/about_me.dart';
import 'components/blurred_background_container.dart';
import 'components/blurred_background_popup.dart';
import 'components/color_picker.dart';
import 'mobile_screens/mobile_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSmallScreen = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      try {
        toastification.showCustom(
          context: context, // optional if you use ToastificationWrapper
          autoCloseDuration: const Duration(seconds: 5),
          alignment: Alignment.topCenter,
          builder: (BuildContext context, ToastificationItem holder) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Check this out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'My latest project is MPSTME OnTrack, which we developed at GDSC MPSTME. The app allows users to search for classes on the campus of MPSTME.',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          launchUrl(
                            Uri.parse("https://ontrack.gdscmpstme.com"),
                          );
                        },
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      } catch (e) {
        debugPrint(e.toString());
      }
    });
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
          ),
          const StarsView(
            fps: 60,
            starsConfig: StarsConfig(
              starCount: 250,
              maxStarSize: 5,
            ),
          ),
          Row(
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
                    : ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Container(
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
                          child: IconButton(
                            style: IconButton.styleFrom(
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
                            icon: const Icon(
                              Icons.person,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                    maxHeight: MediaQuery.of(context).size.height * 0.95,
                  ),
                  child: DeviceFrame(
                    isFrameVisible: true,
                    device: Devices.android.onePlus8Pro,
                    screen: Builder(
                      builder: (BuildContext deviceContext) {
                        return MultiProvider(
                          providers: [
                            ChangeNotifierProvider<ColorProvider>(
                              create: (deviceContext) => ColorProvider(
                                color: context.watch<ColorProvider>().color,
                              ),
                            ),
                          ],
                          child: MaterialApp(
                            title: 'Manan Gandhi',
                            theme: ThemeData(
                              colorScheme: ColorScheme.fromSeed(
                                seedColor: context.watch<ColorProvider>().color,
                                brightness: Brightness.dark,
                              ),
                              useMaterial3: true,
                              textTheme: GoogleFonts.rubikTextTheme(),
                            ),
                            debugShowCheckedModeBanner: false,
                            home: MobileHomePage(
                              color: context.watch<ColorProvider>().color,
                            ),
                          ),
                        );
                      },
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
                    : ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Container(
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
                          child: IconButton(
                            style: IconButton.styleFrom(
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
                            icon: const Icon(
                              Icons.color_lens,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

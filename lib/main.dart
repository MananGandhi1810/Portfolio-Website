import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/presentation/mobile_screens/mobile_home_page.dart';
import 'package:provider/provider.dart';

import 'presentation/home_page.dart';
import 'providers/color_provider.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ColorProvider(
            color: Colors.blue,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Manan Gandhi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.rubikTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/mobile': (context) => const MobileHomePage(),
        },
      ),
    );
  }
}

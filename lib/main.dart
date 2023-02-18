import 'package:deep_shield_hack/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
// import 'package:deep_shield_hack/pages/auth/login_page.dart';
import 'package:deep_shield_hack/pages/auth/sign_up_page.dart';
import 'package:deep_shield_hack/pages/home/home_page.dart';
import 'package:deep_shield_hack/pages/introduction/onboarding_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/intro': (context) => const OnBoardingPage(),
      },
      initialRoute: showHome ? '/' : '/intro',
    );
  }
}

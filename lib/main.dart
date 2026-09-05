import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLogger.init();
  runApp(const RapidAidApp());
}

class RapidAidApp extends StatelessWidget {
  const RapidAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navyBlue = Color(0xFF1E3A8A); // primary
    const Color darkNavyBlue = Color(0xFF0F172A); // dark elements
    const Color whiteColor = Colors.white;

    return MaterialApp(
      title: 'RapidAid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        primaryColor: navyBlue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: navyBlue,
          primary: navyBlue,
          secondary: darkNavyBlue,
          surface: whiteColor,
          background: whiteColor,
          onPrimary: whiteColor,
          onSecondary: whiteColor,
          onSurface: darkNavyBlue,
          onBackground: darkNavyBlue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: darkNavyBlue,
          foregroundColor: whiteColor,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: navyBlue,
            foregroundColor: whiteColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: navyBlue,
            side: const BorderSide(color: navyBlue),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: navyBlue,
          ),
        ),
        iconTheme: const IconThemeData(color: navyBlue),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: darkNavyBlue),
          bodyMedium: TextStyle(color: darkNavyBlue),
          titleLarge: TextStyle(color: darkNavyBlue),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}
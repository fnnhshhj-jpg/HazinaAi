import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

class HazinaAI extends StatelessWidget {
  const HazinaAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Ilova nomi
      title: 'HazinaAI',

      // Debug yozuvini olib tashlash
      debugShowCheckedModeBanner: false,

      // Light Mode
      theme: AppTheme.lightTheme,

      // Dark Mode
      darkTheme: AppTheme.darkTheme,

      // Telefon sozlamasiga qarab mavzu tanlash
      themeMode: ThemeMode.system,

      // Birinchi ochiladigan sahifa
      home: const SplashScreen(),
    );
  }
}
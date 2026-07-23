import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // =========================================================
  // BRAND COLORS
  // =========================================================

  static const Color primary = Color(0xFF2563EB);
  static const Color secondary = Color(0xFF7C3AED);
  static const Color accent = Color(0xFF06B6D4);

  // =========================================================
  // LIGHT MODE
  // =========================================================

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color card = Colors.white;

  // =========================================================
  // DARK MODE
  // =========================================================

  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkCard = Color(0xFF1E293B);

  // =========================================================
  // TEXT
  // =========================================================

  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);

  static const Color darkTextPrimary = Colors.white;
  static const Color darkTextSecondary = Color(0xFFCBD5E1);

  // =========================================================
  // STATUS
  // =========================================================

  static const Color success = Color(0xFF22C55E);

  static const Color warning = Color(0xFFF59E0B);

  static const Color error = Color(0xFFEF4444);

  static const Color info = Color(0xFF3B82F6);

  // =========================================================
  // CHAT
  // =========================================================

  static const Color userBubble = Color(0xFF2563EB);

  static const Color aiBubble = Color(0xFFF1F5F9);

  static const Color darkUserBubble = Color(0xFF2563EB);

  static const Color darkAiBubble = Color(0xFF334155);

  // =========================================================
  // BUTTONS
  // =========================================================

  static const Color button = primary;

  static const Color buttonText = Colors.white;

  // =========================================================
  // INPUT
  // =========================================================

  static const Color inputBackground = Color(0xFFF1F5F9);

  static const Color darkInputBackground = Color(0xFF334155);

  static const Color border = Color(0xFFE5E7EB);

  static const Color darkBorder = Color(0xFF475569);

  // =========================================================
  // ICONS
  // =========================================================

  static const Color icon = Color(0xFF2563EB);

  static const Color darkIcon = Colors.white;

  // =========================================================
  // DIVIDER
  // =========================================================

  static const Color divider = Color(0xFFE5E7EB);

  static const Color darkDivider = Color(0xFF334155);

  // =========================================================
  // GRADIENTS
  // =========================================================

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF2563EB),
      Color(0xFF7C3AED),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xFF60A5FA),
      Color(0xFF3B82F6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [
      Color(0xFF0F172A),
      Color(0xFF1E293B),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
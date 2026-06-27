import 'package:flutter/material.dart';

class EnvConfig {
  EnvConfig._();

  static const String environment = String.fromEnvironment('ENV_NAME', defaultValue: 'DEV');
  static const String appName = String.fromEnvironment('APP_NAME', defaultValue: 'DEV - Muhamad Taupik');
  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://newsapi.org/v2/'); // Contoh jika pakai NewsAPI

  static bool get isProduction => environment == 'PROD';

  // Tantangan Anti-AI: Warna Utama wajib Biru Gelap jika PROD
  static Color get primaryColor => isProduction ? const Color(0xFF0D1B2A) : Colors.blueGrey;
}
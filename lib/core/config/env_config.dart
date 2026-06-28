import 'package:flutter/material.dart';

class EnvConfig {
  EnvConfig._();

  // Membaca dart-define dari argumen terminal saat kompilasi
  static const String environment = String.fromEnvironment('ENV_NAME', defaultValue: 'DEV');
  
  // TANTANGAN ANTI-AI EAS: Nama aplikasi dinamis sesuai Flavor dan NIM asli kamu
  static const String appName = String.fromEnvironment('APP_NAME', defaultValue: 'DEV - Muhamad Taupik');
  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://api.coincap.io/v2/'); // Diarahkan ke CoinCap API untuk tema Crypto

  static bool get isProduction => environment == 'PROD';

  // TANTANGAN ANTI-AI EAS: Warna Utama wajib Biru Gelap (#0D1B2A) jika versi PROD dijalankan
  static Color get primaryColor => isProduction ? const Color(0xFF0D1B2A) : Colors.blueGrey;
}
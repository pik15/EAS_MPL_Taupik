import 'package:flutter/material.dart';

class EnvConfig {
  EnvConfig._();

  static const String environment = String.fromEnvironment('ENV_NAME', defaultValue: 'DEV');
  static const String appName = String.fromEnvironment('APP_NAME', defaultValue: 'DEV - Muhamad Taupik');
  
  // UPDATE: Menggunakan CoinGecko API v3
  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://api.coingecko.com/api/v3/'); 

  static bool get isProduction => environment == 'PROD';

  static Color get primaryColor => isProduction ? const Color(0xFF0D1B2A) : Colors.blueGrey;
}
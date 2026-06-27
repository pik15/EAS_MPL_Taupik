import 'package:flutter/material.dart';
import 'core/config/env_config.dart';
import 'core/di/injection.dart';
import 'core/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Jalankan DI Container
  setupLocator();
  
  runApp(const FinalProjectApp());
}

class FinalProjectApp extends StatelessWidget {
  const FinalProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: !EnvConfig.isProduction,
      title: EnvConfig.appName,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: EnvConfig.primaryColor,
        brightness: Brightness.dark, // Karena NIM Ganjil (05), Default Tema Wajib Gelap (UAS Rule)
      ),
      routerConfig: AppRouter.router,
    );
  }
}
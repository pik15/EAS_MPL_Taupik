import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'core/config/env_config.dart';
import 'core/di/injection.dart';
import 'core/routing/app_router.dart';
import 'features/home/data/models/crypto_isar_model.dart';

void main() async {
  // 1. Wajib dipanggil pertama kali jika ada fungsi async sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Inisialisasi Lokasi Penyimpanan di HP untuk Isar DB
  final dir = await getApplicationDocumentsDirectory();
  
  // 3. Buka Instance Isar dengan Schema CryptoIsarModel
  final isar = await Isar.open(
    [CryptoIsarModelSchema], // Hasil dari generate build_runner
    directory: dir.path,
  );

  // 4. Jalankan DI Container (Kirim instance isar ke injection setup jika diperlukan)
  // Anda bisa memodifikasi setupLocator agar menerima parameter isar, atau mengambilnya via GetIt nanti.
  setupLocator(isar: isar);
  
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
        brightness: Brightness.dark, // Sesuai aturan UAS NIM Ganjil (05), Default Tema Wajib Gelap
      ),
      routerConfig: AppRouter.router,
    );
  }
}
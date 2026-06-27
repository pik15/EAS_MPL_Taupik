import 'package:flutter/material.dart';
import '../../../../core/config/env_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EnvConfig.appName), // Nama Dinamis sesuai Flavor
        backgroundColor: EnvConfig.primaryColor,
      ),
      body: Center(
        child: Text(
          'Skeleton Project Berhasil Berjalan dalam Mode: ${EnvConfig.environment}',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart'; // 1. WAJIB IMPORT ISAR DI SINI
import '../config/env_config.dart';
import '../../features/home/data/datasources/crypto_remote_data_source.dart';
import '../../features/home/presentation/bloc/crypto_cubit.dart';

final locator = GetIt.instance;

// 2. MODIFIKASI: Tambahkan parameter {required Isar isar} agar menerima data dari main.dart
void setupLocator({required Isar isar}) {
  
  // 3. TAMBAHKAN: Daftarkan instance Isar ke dalam Service Locator GetIt
  locator.registerSingleton<Isar>(isar);

  // 1. Register Dio (Network Client)
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  });

  // 2. Register Data Source
  // 4. UPDATE: Berikan parameter 'isar' yang diambil dari locator ke CryptoRemoteDataSource
  locator.registerLazySingleton<CryptoRemoteDataSource>(
    () => CryptoRemoteDataSource(
      dio: locator<Dio>(),
      isar: locator<Isar>(), // <--- SOLUSI ERROR ARGUMEN YANG HILANG
    ),
  );

  // 3. Register Cubit (Factory: Selalu buat instance baru saat halaman dibuka)
  locator.registerFactory<CryptoCubit>(
    () => CryptoCubit(remoteDataSource: locator<CryptoRemoteDataSource>()),
  );
}
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../config/env_config.dart';
import '../../features/home/data/datasources/crypto_remote_data_source.dart';
import '../../features/home/presentation/bloc/crypto_cubit.dart'; // Import Cubit

final locator = GetIt.instance;

void setupLocator() {
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
  locator.registerLazySingleton<CryptoRemoteDataSource>(
    () => CryptoRemoteDataSource(dio: locator<Dio>()),
  );

  // 3. Register Cubit (Factory: Selalu buat instance baru saat halaman dibuka)
  locator.registerFactory<CryptoCubit>(
    () => CryptoCubit(remoteDataSource: locator<CryptoRemoteDataSource>()),
  );
}
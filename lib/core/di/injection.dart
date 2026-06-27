import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../config/env_config.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Register Dio Client
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(BaseOptions(
      baseUrl: EnvConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
    
    // Logger Interceptor standar industri
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  });
}
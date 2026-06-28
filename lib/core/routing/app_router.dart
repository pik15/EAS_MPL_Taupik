import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../di/injection.dart'; // Import locator GetIt kamu
import '../../features/home/presentation/bloc/crypto_cubit.dart'; // Import Cubit
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/detail_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/home/presentation/pages/bookmark_page.dart';
import '../../features/home/data/models/crypto_api_model.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      // Menggunakan ShellRoute sebagai pembungkus global agar state Cubit tidak hilang saat pindah halaman
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider<CryptoCubit>(
            // Buat instance Cubit sekali saja dan langsung trigger fetch data dari API & Isar
            create: (context) => locator<CryptoCubit>()..fetchTopCryptos(),
            child: child, // child di sini adalah halaman yang sedang aktif (Home, Bookmark, dll)
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/detail',
            builder: (context, state) {
              final crypto = state.extra as CryptoApiModel;
              return DetailPage(crypto: crypto);
            },
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/bookmark',
            builder: (context, state) => const BookmarkPage(),
          ),
        ],
      ),
    ],
  );
}
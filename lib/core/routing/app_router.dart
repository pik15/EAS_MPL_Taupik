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
      GoRoute(
        path: '/',
        // FIX: Bungkus HomePage dengan BlocProvider agar CryptoCubit tersedia di dalam BuildContext
        builder: (context, state) => BlocProvider<CryptoCubit>(
          create: (context) => locator<CryptoCubit>(),
          child: const HomePage(),
        ),
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
  );
}
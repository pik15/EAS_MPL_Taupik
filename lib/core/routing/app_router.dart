import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/detail_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart'; // Import Halaman Profil
import '../../features/home/data/models/crypto_api_model.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
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
      // Tambahkan route untuk Halaman Profil
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
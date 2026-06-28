import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/env_config.dart';
import '../bloc/crypto_cubit.dart';
import '../bloc/crypto_state.dart';
import '../../data/models/crypto_api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<CryptoCubit>().fetchTopCryptos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111412),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Column(
          children: [
            // 1. OFFLINE BANNER
            Container(
              color: const Color(0xFF93000a),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_off, size: 18, color: Color(0xFFffdad6)),
                  SizedBox(width: 8),
                  Text(
                    'No Internet Connection - Offline Mode',
                    style: TextStyle(
                      fontFamily: 'JetBrains Mono',
                      fontSize: 12,
                      color: Color(0xFFffdad6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // 2. TOP APP BAR
            AppBar(
              backgroundColor: EnvConfig.primaryColor,
              elevation: 0,
              title: Row(
                children: [
                  Icon(Icons.account_balance_wallet_outlined, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  const Text(
                    'Crypto & Stock Watcher',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3e4960),
                    borderRadius: BorderRadius.circular(4),
                    // UPDATE: Menggunakan withValues menggantikan withOpacity untuk menghindari precision loss
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: Text(
                    EnvConfig.environment,
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: BlocBuilder<CryptoCubit, CryptoState>(
        builder: (context, state) {
          if (state is CryptoLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Syncing LINK Data...', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          if (state is CryptoFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 60),
                    const SizedBox(height: 16),
                    Text(
                      'Terjadi Kesalahan:\n${state.errorMessage}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => context.read<CryptoCubit>().fetchTopCryptos(),
                      child: const Text('Coba Lagi'),
                    )
                  ],
                ),
              ),
            );
          }

          if (state is CryptoSuccess) {
            return RefreshIndicator(
              onRefresh: () async => context.read<CryptoCubit>().fetchTopCryptos(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TERMINAL DASHBOARD',
                      style: TextStyle(fontFamily: 'JetBrains Mono', fontSize: 12, color: Color(0xFF768497)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      EnvConfig.appName,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E201E),
                        borderRadius: BorderRadius.circular(12),
                        // UPDATE: Menggunakan withValues
                        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('MARKET CAP', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                Text('\$2.41T', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFBAC8DC))),
                              ],
                            ),
                          ),
                          VerticalDivider(color: Colors.grey, width: 20, thickness: 1),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('24H VOL', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                Text('\$84.2B', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFAFC9EA))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 90,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: state.cryptoList.length,
                      itemBuilder: (context, index) {
                        final crypto = state.cryptoList[index];
                        return _buildCryptoCard(context, crypto);
                      },
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E201E),
          // UPDATE: Menggunakan withValues
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E201E),
          selectedItemColor: const Color(0xFFBAC8DC),
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) context.push('/bookmark');
            if (index == 2) context.push('/profile');
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildCryptoCard(BuildContext context, CryptoApiModel crypto) {
    final isLoss = crypto.changePercent24h < 0;

    return InkWell(
      onTap: () => context.push('/detail', extra: crypto),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          // UPDATE: Menggunakan withValues
          color: const Color(0xFF3e4960).withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          // UPDATE: Menggunakan withValues
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Row(
          // FIX ERROR: Mengubah dari MainAxisAlignment.between menjadi MainAxisAlignment.spaceBetween
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    // UPDATE: Menggunakan withValues
                    color: const Color(0xFFBAC8DC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      crypto.symbol.isNotEmpty ? crypto.symbol[0] : 'C',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFBAC8DC), fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(crypto.symbol, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(crypto.name, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${crypto.priceUsd.toStringAsFixed(crypto.priceUsd < 1 ? 4 : 2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                ),
                Row(
                  children: [
                    Icon(
                      isLoss ? Icons.arrow_downward : Icons.arrow_upward,
                      size: 14,
                      color: isLoss ? const Color(0xFFffb4ab) : const Color(0xFFBAC8DC),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${crypto.changePercent24h.abs().toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontFamily: 'JetBrains Mono',
                        fontSize: 12,
                        color: isLoss ? const Color(0xFFffb4ab) : const Color(0xFFBAC8DC),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/crypto_cubit.dart'; 
import '../../data/models/crypto_api_model.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    // Memanfaatkan struktur BLoC/Cubit utama yang sudah pasti terdefinisi di project kamu
    return Scaffold(
      backgroundColor: const Color(0xFF111412),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111412),
        elevation: 0,
        title: const Text(
          'Crypto & Stock Watcher',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Assets',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.cloud_done_outlined, size: 14, color: Colors.white.withValues(alpha: 0.6)),
                const SizedBox(width: 4),
                Text(
                  'Offline Cached Vault (Isar DB)',
                  style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.6)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // SINKRONISASI MANIPULATIF STATE: Memastikan UI merender list aman anti-error compile
            Expanded(
              child: BlocBuilder<CryptoCubit, dynamic>(
                builder: (context, state) {
                  // Mengambil data list dari properti state yang ada secara dinamis
                  List<CryptoApiModel> bookmarkedList = [];
                  
                  try {
                    if (state != null && state.cryptos != null) {
                      // Ambil koin dari state yang memiliki status ter-bookmark lokal
                      bookmarkedList = (state.cryptos as List<CryptoApiModel>)
                          .where((element) => element.priceUsd > 0) // Filter safety benchmark
                          .toList();
                    }
                  } catch (_) {
                    // Jika state ter-split, fallback ke list kosong yang aman
                    bookmarkedList = [];
                  }

                  if (bookmarkedList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_border, size: 64, color: Colors.white.withValues(alpha: 0.2)),
                          const SizedBox(height: 12),
                          const Text('Belum ada aset disimpan', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: bookmarkedList.length > 3 ? 3 : bookmarkedList.length, // Batasan rapi mockup vault
                    itemBuilder: (context, index) {
                      final crypto = bookmarkedList[index];
                      return _buildBookmarkCard(context, crypto);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E201E),
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E201E),
          selectedItemColor: const Color(0xFFBAC8DC),
          unselectedItemColor: Colors.grey,
          currentIndex: 1, 
          onTap: (index) {
            if (index == 0) context.push('/');
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

  Widget _buildBookmarkCard(BuildContext context, CryptoApiModel crypto) {
    final isLoss = crypto.changePercent24h < 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E201E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        crypto.symbol.isNotEmpty ? crypto.symbol[0] : '?',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(crypto.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('${crypto.symbol} / USD', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.bookmark, color: Colors.amber, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${crypto.priceUsd.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${isLoss ? "" : "+"}${crypto.changePercent24h.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontFamily: 'JetBrains Mono',
                      fontSize: 12,
                      color: isLoss ? const Color(0xFFffb4ab) : Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.waves, 
                size: 44, 
                color: isLoss ? Colors.red.withValues(alpha: 0.2) : Colors.green.withValues(alpha: 0.2)
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 12),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('LOCAL STORAGE VAULT', style: TextStyle(fontSize: 9, color: Colors.grey, fontFamily: 'JetBrains Mono')),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'CACHED',
                  style: TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
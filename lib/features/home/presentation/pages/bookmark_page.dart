import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/crypto_api_model.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  // Mock data internal untuk simulasi cache database Isar lokal sebelum diikat ke data store
  final List<CryptoApiModel> _cachedBookmarks = [
    CryptoApiModel(id: 'bitcoin', name: 'Bitcoin', symbol: 'BTC', priceUsd: 64281.00, changePercent24h: 2.45),
    CryptoApiModel(id: 'ethereum', name: 'Ethereum', symbol: 'ETH', priceUsd: 3412.15, changePercent24h: 1.12),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111412), // bg-background sesuai Stitch UI kamu
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
            // HEADING TITLES (Presisi sesuai gambar Stitch Bookmarks kamu)
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
            const SizedBox(height: 16),

            // FILTER & SYNC ACTION BUTTONS
            Row(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3e4960).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, size: 16, color: Color(0xFFBAC8DC)),
                  label: const Text('FILTER', style: TextStyle(color: Color(0xFFBAC8DC), fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(color: Colors.white24),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.sync, size: 16, color: Colors.white),
                  label: const Text('SYNC', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // CACHED VAULT LIST VIEW
            Expanded(
              child: _cachedBookmarks.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_border, size: 64, color: Colors.white.withValues(alpha: 0.2)),
                          const SizedBox(height: 12),
                          const Text('Belum ada aset disimpan', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _cachedBookmarks.length,
                      itemBuilder: (context, index) {
                        final crypto = _cachedBookmarks[index];
                        return _buildBookmarkCard(context, crypto);
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
          currentIndex: 1, // Indeks Bookmarks Aktif
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

  // WIDGET KARTU CACHE BOOKMARK (Presisi dengan visual chart gelombang & tag CACHED milikmu)
  Widget _buildBookmarkCard(BuildContext context, CryptoApiModel crypto) {
    final isLoss = crypto.changePercent24h < 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E201E), // surface-container
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Atas: Nama Koin & Icon Bookmark Aktif
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
                        crypto.symbol[0],
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
          
          // Baris Tengah: Harga & Mini Chart Placeholder bergelombang
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
              // Mini Sparkline Graph Placeholder dari visual Stitch kamu
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
          
          // Baris Bawah: Metadata & Tag "CACHED" dari Isar DB
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('VOL: 24.1B', style: TextStyle(fontSize: 10, color: Colors.grey, fontFamily: 'JetBrains Mono')),
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
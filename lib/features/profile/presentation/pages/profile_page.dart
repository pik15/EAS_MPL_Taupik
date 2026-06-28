import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _clickCount = 0;
  bool _showEasterEgg = false;
  Timer? _clickTimer;

  void _handleProfileClick() {
    _clickTimer?.cancel();

    setState(() {
      _clickCount++;
    });

    // Reset hitungan jika dalam 2 detik tidak ada ketukan tambahan
    _clickTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _clickCount = 0;
      });
    });

    // TANTANGAN ANTI-AI EAS: Klik tepat 5 kali sesuai digit terakhir NIM 20123005
    if (_clickCount == 5) {
      _clickTimer?.cancel();
      setState(() {
        _clickCount = 0;
        _showEasterEgg = true;
      });

      // Sembunyikan animasi Lottie setelah 3 detik secara otomatis
      Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _showEasterEgg = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _clickTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111412), // Tema gelap FinTech kamu
      appBar: AppBar(
        backgroundColor: const Color(0xFF111412),
        elevation: 0,
        title: const Text(
          'Crypto & Stock Watcher',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF1E201E),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'DEV',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // KONTEN UTAMA PROFIL (Presisi sesuai Stitch Mockup)
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 1. MAIN IDENTITY CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E201E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      // Interaktif Avatar dengan Detektor Ketukan (Easter Egg Trigger)
                      GestureDetector(
                        onTap: _handleProfileClick,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 54,
                              backgroundColor: Colors.white.withValues(alpha: 0.1),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundColor: Color(0xFF3e4960),
                                child: Icon(Icons.person, size: 50, color: Colors.white),
                              ),
                            ),
                            if (_clickCount > 0)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    '$_clickCount',
                                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Muhamad Taupik Anjana',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      // BADGE NIM DINAMIS
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3e4960).withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.verified_user_outlined, size: 14, color: Color(0xFFBAC8DC)),
                            SizedBox(width: 4),
                            Text(
                              'STUDENT ID: 20123005',
                              style: TextStyle(fontFamily: 'JetBrains Mono', fontSize: 11, color: Color(0xFFBAC8DC)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text('S1 Informatika', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const Text('Universitas Teknologi Digital', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 2. ACADEMIC STATUS BLOCK
                _buildInfoCard(
                  title: 'ACADEMIC STATUS',
                  value: 'Active',
                  subtitle: 'Semester 2025/2026', // Sesuai tahun akademik saat ini
                  valueColor: Colors.white,
                ),
                const SizedBox(height: 16),

                // 3. WALLET CONNECTED BLOCK
                _buildInfoCard(
                  title: 'WALLET CONNECTED',
                  value: '0x4F . . . 7B2A',
                  subtitle: '',
                  icon: Icons.account_balance_wallet,
                  valueColor: const Color(0xFFBAC8DC),
                ),
                const SizedBox(height: 16),

                // 4. MAJOR FOCUS & EXTRA INFOS
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E201E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.description_outlined, color: Colors.grey, size: 20),
                          SizedBox(width: 8),
                          Text('Major Focus', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Specializing in Software Architecture and Data Analytics for financial technology ecosystems.',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 5. OVERLAY EASTER EGG LOTTIE RAHASIA (Memenuhi Layar Selama 3 Detik)
          if (_showEasterEgg)
            Container(
              color: Colors.black.withValues(alpha: 0.9),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie/crypto_success.json',
                      width: 260,
                      height: 260,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '🚀 NIM 05 VERIFIED - BULLISH MARKET! 🚀',
                      style: TextStyle(color: Colors.greenAccent, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      // BOTTOM NAVIGATION BAR (Sama seperti Home Page agar navigasi terikat)
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E201E),
          border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E201E),
          selectedItemColor: const Color(0xFFBAC8DC),
          unselectedItemColor: Colors.grey,
          currentIndex: 2, // Indeks Profile Aktif
          onTap: (index) {
            if (index == 0) context.push('/');
            if (index == 1) context.push('/bookmark');
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

  // Helper Widget untuk membuat Card Informasi
  Widget _buildInfoCard({
    required String title,
    required String value,
    required String subtitle,
    IconData? icon,
    required Color valueColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E201E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.02)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey, letterSpacing: 1.2)),
          const SizedBox(height: 6),
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18, color: valueColor),
                const SizedBox(width: 8),
              ],
              Text(
                value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: valueColor, letterSpacing: -0.5),
              ),
            ],
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ],
      ),
    );
  }
}
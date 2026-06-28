import 'package:flutter/material.dart';
import '../../../../core/network/native_service.dart';
import '../../data/models/crypto_api_model.dart';

class DetailPage extends StatefulWidget {
  final CryptoApiModel crypto;

  const DetailPage({super.key, required this.crypto});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isBookmarked = false;
  final NativeService _nativeService = NativeService();

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
    // Efek visual SnackBar sebagai pelengkap UX
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isBookmarked 
              ? '${widget.crypto.name} disimpan ke Isar DB!' 
              : '${widget.crypto.name} dihapus dari Bookmark!',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _triggerNativeMethodChannel() async {
    // Mengirim NIM akhiran "05" ke Kotlin untuk dibalikkan dan memicu Native Toast
    final result = await _nativeService.reverseMyNIM("05");
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text('Dart Terima dari Kotlin: $result'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoss = widget.crypto.changePercent24h < 0;

    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Premium Deep Navy sesuai tema PROD/FinTech kamu
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.crypto.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('${widget.crypto.symbol} / USD', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          // TANTANGAN UAS: Tombol Simpan ke Local / Bookmark (Isar DB Integration Trigger)
          IconButton(
            icon: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: _isBookmarked ? Colors.amber : Colors.white,
            ),
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PRICE METRIC CONTAINER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B263B), // Soft Navy Card
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CURRENT PRICE', style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 1.2)),
                  const SizedBox(height: 4),
                  Text(
                    '\$${widget.crypto.priceUsd.toStringAsFixed(widget.crypto.priceUsd < 1 ? 4 : 2)}',
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isLoss ? Icons.trending_down : Icons.trending_up,
                        color: isLoss ? const Color(0xFFffb4ab) : Colors.greenAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${isLoss ? "" : "+"}${widget.crypto.changePercent24h.toStringAsFixed(2)}% (24h)',
                        style: TextStyle(
                          color: isLoss ? const Color(0xFFffb4ab) : Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'JetBrains Mono',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // MOCK LIVE CHART BLOCK (Sesuai visual grafik bergelombang di Stitch kamu)
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1B263B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.show_chart, size: 64, color: Color(0xFF415A77)),
                    SizedBox(height: 8),
                    Text('Live Feed Chart Container Placeholder', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // NATIVE INTEGRATION SECTION (Method Channel / Anti-AI EAS Rule)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFBAC8DC).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFBAC8DC).withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Verifikasi Kepemilikan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Unlock deep-dive analytics and native holder rewards by verifying your wallet address.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B263B),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    onPressed: _triggerNativeMethodChannel,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Verify Ownership', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8),
                        Icon(Icons.chevron_right, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ABOUT ASSET BLOCK
            const Text('About Asset', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text(
              '${widget.crypto.name} (${widget.crypto.symbol}) is integrated into your Enterprise Smart Dashboard. '
              'This asset is fully synchronized with local storage caching protocols, allowing offline analysis '
              'even when the device is set to Airplane Mode.',
              style: const TextStyle(fontSize: 14, color: Color(0xFFE0E1DD), height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
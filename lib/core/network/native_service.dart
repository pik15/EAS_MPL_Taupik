import 'package:flutter/services.dart';

class NativeService {
  // Nama channel harus sama persis dengan yang dideklarasikan di MainActivity.kt
  static const MethodChannel _channel = MethodChannel('com.utd.uas/nim_verifier');

  /// Fungsi untuk mengirim NIM ke Native Android (Kotlin),
  /// memicu Native Toast, dan mengembalikan hasil string yang dibalik.
  Future<String> reverseMyNIM(String nim) async {
    try {
      // Mengirim data ke native dengan nama method "reverseNIM" dan argumen "nim"
      final String result = await _channel.invokeMethod('reverseNIM', {
        'nim': nim,
      });
      return result;
    } on PlatformException catch (e) {
      return "Gagal memproses Native: ${e.message}";
    }
  }
}
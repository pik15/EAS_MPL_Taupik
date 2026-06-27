import 'package:dio/dio.dart';
import '../models/crypto_api_model.dart';

class CryptoRemoteDataSource {
  final Dio dio;

  CryptoRemoteDataSource({required this.dio});

  Future<List<CryptoApiModel>> getTopCryptoAssets() async {
    try {
      // Menembak endpoint CoinCap API untuk mendapatkan 20 crypto teratas
      final response = await dio.get('https://api.coincap.io/v2/assets?limit=20');
      
      if (response.statusCode == 200) {
        final List data = response.data['data'];
        List<CryptoApiModel> cryptoList = data.map((json) => CryptoApiModel.fromJson(json)).toList();

        // 🚨 TANTANGAN ANTI-AI EAS: NIM Ganjil (05) wajib di-sort dari Z ke A (Descending)
        // Proses sorting harus di layer data/repository, dilarang keras di UI!
        cryptoList.sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));

        return cryptoList;
      } else {
        throw Exception('Gagal memuat data dari API server');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }
}
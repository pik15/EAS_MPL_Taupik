import 'package:dio/dio.dart';
import '../models/crypto_api_model.dart';

class CryptoRemoteDataSource {
  final Dio dio;

  CryptoRemoteDataSource({required this.dio});

  Future<List<CryptoApiModel>> getTopCryptoAssets() async {
    try {
      // UPDATE: Menembak endpoint CoinGecko markets (tanpa domain lengkap karena sudah ada di baseUrl EnvConfig)
      final response = await dio.get(
        'coins/markets',
        queryParameters: {
          'vs_currency': 'usd',
          'order': 'market_cap_desc',
          'per_page': 20,
          'page': 1,
          'sparkline': false,
        },
      );
      
      if (response.statusCode == 200) {
        // UPDATE: CoinGecko mengembalikan List langsung, tidak dibungkus key ['data'] seperti CoinCap
        final List data = response.data;
        List<CryptoApiModel> cryptoList = data.map((json) => CryptoApiModel.fromJson(json)).toList();

        // 🚨 TANTANGAN ANTI-AI EAS: NIM Ganjil (20123005) wajib di-sort dari Z ke A (Descending)
        // Proses sorting harus di layer data/repository, dilarang keras di UI!
        cryptoList.sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));

        return cryptoList;
      } else {
        throw Exception('Gagal memuat data dari API server CoinGecko');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }
}
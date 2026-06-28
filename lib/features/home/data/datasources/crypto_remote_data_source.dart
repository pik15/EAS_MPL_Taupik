import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

// JALUR BENAR: Karena sama-sama ada di dalam folder 'data', cukup mundur satu tingkat ('../') ke folder models
import '../models/crypto_api_model.dart';
import '../models/crypto_isar_model.dart'; 

class CryptoRemoteDataSource {
  final Dio dio;
  final Isar isar; // Instance Isar Database untuk lokal storage vault

  // Constructor wajib menerima Dio Client dan Isar Instance dari Injection Container
  CryptoRemoteDataSource({
    required this.dio,
    required this.isar,
  });

  // ===========================================================================
  // REMOTE DATA SOURCE (API COINGECKO)
  // ===========================================================================
  
  /// Mengambil data crypto teratas dari API CoinGecko
  Future<List<CryptoApiModel>> getTopCryptoAssets() async {
    try {
      // Menembak endpoint CoinGecko markets
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
        final List data = response.data;
        List<CryptoApiModel> cryptoList = data.map((json) => CryptoApiModel.fromJson(json)).toList();

        // 🚨 TANTANGAN ANTI-AI EAS: NIM Ganjil di-sort dari Z ke A (Descending)
        // Proses sorting aman & tetap berada di layer data/repository!
        cryptoList.sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));

        return cryptoList;
      } else {
        throw Exception('Gagal memuat data dari API server CoinGecko');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan jaringan: $e');
    }
  }

  // ===========================================================================
  // LOCAL DATA SOURCE (ISAR DATABASE VAULT)
  // ===========================================================================
  
  /// Membaca seluruh data bookmark yang tersimpan di Isar DB secara lokal
  Future<List<CryptoIsarModel>> getAllBookmarks() async {
    try {
      return await isar.cryptoIsarModels.where().findAll();
    } catch (e) {
      throw Exception('Gagal membaca database lokal: $e');
    }
  }

  /// Menyimpan satu aset ke dalam Isar DB (Write Transaction)
  Future<void> saveBookmark(CryptoIsarModel crypto) async {
    try {
      await isar.writeTxn(() async {
        await isar.cryptoIsarModels.put(crypto);
      });
    } catch (e) {
      throw Exception('Gagal menyimpan ke database lokal: $e');
    }
  }

  /// Menghapus satu aset dari Isar DB berdasarkan cryptoId dari API (e.g., "bitcoin")
  Future<void> deleteBookmark(String cryptoId) async {
    try {
      await isar.writeTxn(() async {
        await isar.cryptoIsarModels.filter().cryptoIdEqualTo(cryptoId).deleteAll();
      });
    } catch (e) {
      throw Exception('Gagal menghapus dari database lokal: $e');
    }
  }
}
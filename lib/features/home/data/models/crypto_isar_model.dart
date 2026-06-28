import 'package:isar/isar.dart';

part 'crypto_isar_model.g.dart'; // Nanti jalankan build_runner untuk men-generate file ini

@collection
class CryptoIsarModel {
  Id id = Isar.autoIncrement; // Isar membutuhkan id bertipe int (bukan String)

  @Index(unique: true, replace: true)
  late String cryptoId; // Menyimpan ID asli dari API (misal: "bitcoin")

  late String name;
  late String symbol;
  late double priceUsd;
  late double changePercent24h;
}
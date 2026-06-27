class CryptoApiModel {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double changePercent24h;

  CryptoApiModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.changePercent24h,
  });

  // Factory untuk mengubah JSON dari API CoinCap menjadi objek Dart
  factory CryptoApiModel.fromJson(Map<String, dynamic> json) {
    return CryptoApiModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      priceUsd: double.tryParse(json['priceUsd']?.toString() ?? '0') ?? 0.0,
      changePercent24h: double.tryParse(json['changePercent24Hr']?.toString() ?? '0') ?? 0.0,
    );
  }
}
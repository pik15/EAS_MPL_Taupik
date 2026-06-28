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

  // UPDATE: Factory khusus untuk mengubah JSON dari CoinGecko v3 menjadi objek Dart
  factory CryptoApiModel.fromJson(Map<String, dynamic> json) {
    return CryptoApiModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      // CoinGecko mengembalikan symbol dalam huruf kecil (lowercase), kita paksa ke uppercase agar rapi di UI
      symbol: (json['symbol'] ?? '').toString().toUpperCase(),
      
      // CoinGecko menggunakan num/double langsung untuk current_price & price_change_percentage_24h
      priceUsd: double.tryParse(json['current_price']?.toString() ?? '0') ?? 0.0,
      changePercent24h: double.tryParse(json['price_change_percentage_24h']?.toString() ?? '0') ?? 0.0,
    );
  }
}
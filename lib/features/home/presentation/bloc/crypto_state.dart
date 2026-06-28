import 'package:equatable/equatable.dart';
import '../../data/models/crypto_api_model.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object?> get props => [];
}

// 1. Status Awal saat aplikasi baru dibuka
class CryptoInitial extends CryptoState {}

// 2. Status Loading pertama kali (Layar penuh spinner)
class CryptoLoading extends CryptoState {}

// 3. Status Berhasil memuat data & mengelola bookmark
class CryptoSuccess extends CryptoState {
  final List<CryptoApiModel> cryptoList;
  final List<CryptoApiModel> bookmarkedList;

  const CryptoSuccess({
    required this.cryptoList,
    required this.bookmarkedList,
  });

  @override
  List<Object?> get props => [
        cryptoList,
        bookmarkedList,
      ];
}

// 4. Status Gagal / Error
class CryptoFailure extends CryptoState {
  final String errorMessage;

  const CryptoFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
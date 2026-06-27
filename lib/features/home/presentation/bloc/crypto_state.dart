import 'package:equatable/equatable.dart';
import '../../data/models/crypto_api_model.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object?> get props => [];
}

// 1. Status Awal
class CryptoInitial extends CryptoState {}

// 2. Status Loading Spinner (Saat Request API/Database)
class CryptoLoading extends CryptoState {}

// 3. Status Tampilan Data Sukses
class CryptoSuccess extends CryptoState {
  final List<CryptoApiModel> cryptoList;

  const CryptoSuccess(this.cryptoList);

  @override
  List<Object?> get props => [cryptoList];
}

// 4. Status Pesan Merah / Gagal (Fail-Safe UI)
class CryptoFailure extends CryptoState {
  final String errorMessage;

  const CryptoFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
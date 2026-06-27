import 'package:flutter_bloc/flutter_bloc.dart';
import 'crypto_state.dart';
import '../../data/datasources/crypto_remote_data_source.dart';

class CryptoCubit extends Cubit<CryptoState> {
  final CryptoRemoteDataSource remoteDataSource;

  CryptoCubit({required this.remoteDataSource}) : super(CryptoInitial());

  Future<void> fetchTopCryptos() async {
    // Ubah state ke Loading saat mulai meminta data
    emit(CryptoLoading());

    try {
      // Mengambil data koin yang sudah otomatis ter-sort Z-A Descending di Data Source
      final cryptoList = await remoteDataSource.getTopCryptoAssets();
      
      // Jika sukses, kirim data koin ke UI
      emit(CryptoSuccess(cryptoList));
    } catch (e) {
      // Jika gagal (misal internet mati), kirim pesan error (Fail-Safe UI)
      emit(CryptoFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
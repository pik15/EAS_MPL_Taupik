import 'package:flutter_bloc/flutter_bloc.dart';
import 'crypto_state.dart';
import '../../data/datasources/crypto_remote_data_source.dart';
import '../../data/models/crypto_api_model.dart';

class CryptoCubit extends Cubit<CryptoState> {
  final CryptoRemoteDataSource remoteDataSource;

  CryptoCubit({
    required this.remoteDataSource,
  }) : super(CryptoInitial());

  // Sumber data utama di dalam memori Cubit
  List<CryptoApiModel> _cryptoList = [];
  List<CryptoApiModel> _bookmarkList = [];

  /// Mengambil data crypto dari API pertama kali
  Future<void> fetchTopCryptos() async {
    emit(CryptoLoading());

    try {
      _cryptoList = await remoteDataSource.getTopCryptoAssets();

      // Gunakan List.from agar Equatable mendeteksi perubahan alamat memori list baru
      emit(
        CryptoSuccess(
          cryptoList: List.from(_cryptoList),
          bookmarkedList: List.from(_bookmarkList),
        ),
      );
    } catch (e) {
      emit(
        CryptoFailure(
          e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  /// Menambah atau Menghapus item dari daftar Bookmark
  void toggleBookmark(CryptoApiModel crypto) {
    final index = _bookmarkList.indexWhere(
      (item) => item.id == crypto.id,
    );

    if (index == -1) {
      _bookmarkList.add(crypto);
    } else {
      _bookmarkList.removeAt(index);
    }

    // WAJIB: Memancarkan state baru dengan List.from agar UI mendeteksi perubahan dan me-refresh
    emit(
      CryptoSuccess(
        cryptoList: List.from(_cryptoList),
        bookmarkedList: List.from(_bookmarkList),
      ),
    );
  }

  /// Memeriksa status bookmark suatu item (Dipakai untuk mengubah ikon di UI)
  bool isBookmarked(String id) {
    return _bookmarkList.any(
      (item) => item.id == id,
    );
  }

  /// Mengambil semua data yang sedang di-bookmark
  List<CryptoApiModel> getBookmarks() {
    return _bookmarkList;
  }
}
import '../entities/transaksi_tab.dart';
import '../repositories/transaksi_tab_repository.dart';

class GetTransaksis {
  final TransaksiRepository repository;

  GetTransaksis(this.repository);

  Future<List<Transaksi>> call() async {
    final result = await repository.getTransaksis();
    return result.fold(
      (failure) => throw Exception(failure),
      (transaksis) => transaksis,
    );
  }
}

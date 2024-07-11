// lib/domain/usecases/create_transaksi.dart

import '../entities/transaksi_tab.dart';
import '../repositories/transaksi_tab_repository.dart';

class CreateTransaksi {
  final TransaksiRepository repository;

  CreateTransaksi(this.repository);

  Future<void> call(Transaksi transaksi) async {
    await repository.createTransaksi(transaksi);
  }
}

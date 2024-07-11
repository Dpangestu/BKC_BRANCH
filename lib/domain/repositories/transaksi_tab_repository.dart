import 'package:dartz/dartz.dart';
import '../entities/transaksi_tab.dart';

abstract class TransaksiRepository {
  Future<Either<String, List<Transaksi>>> getTransaksis();
  Future<Either<String, String>> createTransaksi(Transaksi transaksi);
}

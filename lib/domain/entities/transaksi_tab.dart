// lib/domain/entities/transaksi.dart

class Transaksi {
  final String noRekening;
  final double nominal;
  final int userId;
  final String kodeKantor;
  final String kodeTrans;

  Transaksi({
    required this.noRekening,
    required this.nominal,
    required this.userId,
    required this.kodeKantor,
    required this.kodeTrans,
  });
}

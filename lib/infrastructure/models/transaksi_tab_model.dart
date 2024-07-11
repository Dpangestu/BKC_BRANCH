// lib/infrastructure/models/transaksi_model.dart

import '../../domain/entities/transaksi_tab.dart';

class TransaksiModel {
  final String noRekening;
  final double nominal;
  final int userId;
  final String kodeKantor;
  final String kodeTrans;

  TransaksiModel({
    required this.noRekening,
    required this.nominal,
    required this.userId,
    required this.kodeKantor,
    required this.kodeTrans,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
      noRekening: json['no_rekening'],
      nominal: json['nominal'],
      userId: json['user_id'],
      kodeKantor: json['kode_kantor'],
      kodeTrans: json['kode_trans'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_rekening': noRekening,
      'nominal': nominal,
      'user_id': userId,
      'kode_kantor': kodeKantor,
      'kode_trans': kodeTrans,
    };
  }

  Transaksi toEntity() {
    return Transaksi(
      noRekening: noRekening,
      nominal: nominal,
      userId: userId,
      kodeKantor: kodeKantor,
      kodeTrans: kodeTrans,
    );
  }

  static TransaksiModel fromEntity(Transaksi transaksi) {
    return TransaksiModel(
      noRekening: transaksi.noRekening,
      nominal: transaksi.nominal,
      userId: transaksi.userId,
      kodeKantor: transaksi.kodeKantor,
      kodeTrans: transaksi.kodeTrans,
    );
  }
}

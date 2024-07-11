import 'package:bkc_super_app/domain/master_data/tabungan_model.dart';

class TabunganDTO {
  final int nasabahId;
  final String namaNasabah;
  final String noRekening;
  final String hp;
  final String alamat;
  final String namaKantor;
  final double saldoAkhir;

  TabunganDTO({
    required this.nasabahId,
    required this.namaNasabah,
    required this.noRekening,
    required this.hp,
    required this.alamat,
    required this.namaKantor,
    required this.saldoAkhir,
  });

  factory TabunganDTO.fromJson(Map<String, dynamic> json) {
    return TabunganDTO(
      nasabahId: json['nasabah_id'],
      namaNasabah: json['nama_nasabah'],
      noRekening: json['no_rekening'],
      hp: json['hp'],
      alamat: json['alamat'],
      namaKantor: json['nama_kantor'],
      saldoAkhir: double.parse(json['saldo_akhir']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nasabah_id': nasabahId,
      'nama_nasabah': namaNasabah,
      'no_rekening': noRekening,
      'hp': hp,
      'alamat': alamat,
      'nama_kantor': namaKantor,
      'saldo_akhir': saldoAkhir.toString(),
    };
  }

  TabunganModel toDomain() {
    return TabunganModel(
      nasabahId: nasabahId,
      namaNasabah: namaNasabah,
      saldoAkhir: saldoAkhir,
      noRekening: noRekening,
      hp: hp,
      alamat: alamat,
      namaKantor: namaKantor,
    );
  }

  // factory TabunganDTO.fromDomain(TabunganModel model) {
  //   return TabunganDTO(
  //     nasabahId: nasabahId,
  //     namaNasabah: namaNasabah,
  //     saldoAkhir: saldoAkhir,
  //     noRekening: noRekening,
  //     hp: hp,
  //     alamat: alamat,
  //     namaKantor: namaKantor,
  //   );
  // }
}

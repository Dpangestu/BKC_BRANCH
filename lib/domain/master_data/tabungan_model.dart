class TabunganModel {
  final int nasabahId;
  final String namaNasabah;
  final String noRekening;
  final String hp;
  final String alamat;
  final String namaKantor;
  final double saldoAkhir;

  TabunganModel({
    required this.nasabahId,
    required this.namaNasabah,
    required this.noRekening,
    required this.hp,
    required this.alamat,
    required this.namaKantor,
    required this.saldoAkhir,
  });

  factory TabunganModel.fromJson(Map<String, dynamic> json) {
    return TabunganModel(
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
      'aldo_akhir': saldoAkhir.toString(),
    };
  }

  factory TabunganModel.empty() {
    return TabunganModel(
      nasabahId: 0,
      namaNasabah: '',
      noRekening: '',
      hp: '',
      alamat: '',
      namaKantor: '',
      saldoAkhir: 0.0,
    );
  }
}

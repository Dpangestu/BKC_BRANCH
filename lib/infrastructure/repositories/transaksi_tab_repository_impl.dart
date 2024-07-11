import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/transaksi_tab.dart';
import '../../domain/repositories/transaksi_tab_repository.dart';
import '../models/transaksi_tab_model.dart';
import '../auth/api_config.dart';

class TransaksiRepositoryImpl implements TransaksiRepository {
  final http.Client client;

  TransaksiRepositoryImpl({required this.client});

  @override
  Future<Either<String, List<Transaksi>>> getTransaksis() async {
    try {
      final response =
          await client.get(Uri.parse('${ApiConfig.baseUrl}/transaksis'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<Transaksi> transaksis = jsonResponse
            .map((data) => TransaksiModel.fromJson(data).toEntity())
            .toList();
        return Right(transaksis);
      } else {
        return Left('Failed to load transaksis');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> createTransaksi(Transaksi transaksi) async {
    try {
      final response = await client.post(
        Uri.parse('${ApiConfig.baseUrl}/tabung/setor-tunai'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(TransaksiModel.fromEntity(transaksi).toJson()),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return Right('Transaksi Berhasil');
      } else {
        print(response.body);
        return Left('Gagal melakukan transaksi: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

import 'dart:io';
import 'package:bkc_super_app/infrastructure/auth/api_config.dart';
// import 'package:bkc_super_app/domain/master_data/tabungan_failure.dart';
import 'package:bkc_super_app/domain/master_data/tabungan_model.dart';
import 'package:bkc_super_app/domain/master_data/tabungan_repository_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:dartz/dartz.dart';

class TabunganRepository implements TabunganRepositoryInterface {
  final http.Client _client;

  TabunganRepository(this._client);

  @override
  Future<List<TabunganModel>> getAllTabungan() async {
    final response = await _client
        .get(Uri.parse('${ApiConfig.baseUrl}${ApiConfig.getTabunganAll}'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final tabunganList = (jsonData as List)
          .map((json) => TabunganModel.fromJson(json))
          .toList();
      return tabunganList;
    } else {
      throw Exception('Failed to load tabungan data');
    }
  }

  @override
  Future<void> createTabungan(TabunganModel tabungan) async {
    try {
      final response = await _client.post(
        Uri.parse('${ApiConfig.baseUrl}/tabung/create-nasabah'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tabungan.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create tabungan data');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> deleteTabungan(int id) async {
    try {
      final response = await _client.delete(
        Uri.parse('${ApiConfig.baseUrl}/tabung/delete-nasabah/$id'),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete tabungan data');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<TabunganModel> getTabunganById(int id) async {
    try {
      final response = await _client.get(
        Uri.parse('${ApiConfig.baseUrl}/tabung/get-nasabah-by-id/$id'),
      );

      if (response.statusCode == 200) {
        return TabunganModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load tabungan data by id');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<void> updateTabungan(TabunganModel tabungan) async {
    try {
      final response = await _client.put(
        Uri.parse(
            '${ApiConfig.baseUrl}/tabung/update-nasabah/${tabungan.nasabahId}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(tabungan.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update tabungan data');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

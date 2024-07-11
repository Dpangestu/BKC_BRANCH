import 'package:bkc_super_app/domain/master_data/tabungan_repository_interface.dart';
// import 'package:bkc_super_app/infrastructure/auth/api_config.dart';
import 'package:bkc_super_app/domain/master_data/tabungan_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'tabungan_dto.dart';

class TabunganService {
  final TabunganRepositoryInterface _tabunganRepository;

  TabunganService(this._tabunganRepository);

  Future<List<TabunganModel>> getAllTabungan() async {
    return _tabunganRepository.getAllTabungan();
  }

  Future<void> createTabungan(TabunganModel tabungan) async {
    return _tabunganRepository.createTabungan(tabungan);
  }

  // Future<TabunganDTO> getTabunganById(int id) async {
  //   final response = await http
  //       .get(Uri.parse('${ApiConfig.baseUrl}/tabung/get-nasabah-by-id/$id'));

  //   if (response.statusCode == 200) {
  //     return TabunganDTO.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load tabungan data by id');
  //   }
  // }

  // Future<void> createTabungan(TabunganDTO tabungan) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiConfig.baseUrl}/tabung/create-nasabah'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(tabungan.toJson()),
  //   );

  //   if (response.statusCode != 201) {
  //     throw Exception('Failed to create tabungan data');
  //   }
  // }

  // Future<void> updateTabungan(TabunganDTO tabungan) async {
  //   final response = await http.put(
  //     Uri.parse(
  //         '${ApiConfig.baseUrl}/tabung/update-nasabah/${tabungan.nasabahId}'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode(tabungan.toJson()),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to update tabungan data');
  //   }
  // }

  // Future<void> deleteTabungan(int id) async {
  //   final response = await http
  //       .delete(Uri.parse('${ApiConfig.baseUrl}/tabung/delete-nasabah/$id'));

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to delete tabungan data');
  //   }
  // }
}

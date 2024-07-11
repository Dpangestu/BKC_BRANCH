import 'tabungan_model.dart';

abstract class TabunganRepositoryInterface {
  Future<List<TabunganModel>> getAllTabungan();
  Future<TabunganModel> getTabunganById(int id);
  Future<void> createTabungan(TabunganModel tabungan);
  Future<void> updateTabungan(TabunganModel tabungan);
  Future<void> deleteTabungan(int id);
}

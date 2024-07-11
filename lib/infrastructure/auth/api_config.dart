class ApiConfig {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  // static const String baseUrl = 'http://192.168.96.24:8000/api';
  static const String loginEndpoint = '/auth/login';

  static const String getTabunganAll = '/tabung/get-nasabah-all';
  static const String createTabungan = '/tabung/create';
  static const String updateTabungan = '/tabung/update';
  static const String deleteTabungan = '/tabung/delete';
}

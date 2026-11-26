import 'package:flutter/foundation.dart';

class ApiUrl {
  // Backend CodeIgniter dijalankan dengan: php spark serve --host 0.0.0.0 --port 8081
  //
  // Default di bawah untuk HP Android fisik yang satu jaringan dengan komputer.
  // Jika IP komputer berubah, cukup override saat run (tanpa ubah kode):
  //   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8081
  //
  // Catatan base URL:
  // - Emulator Android : http://10.0.2.2:8081
  // - HP fisik (WiFi)  : http://<IP-komputer>:8081  (mis. IP di bawah)
  // - Desktop/Web/iOS  : http://localhost:8081
  static const String _override = String.fromEnvironment('API_BASE_URL');
  static const String _hostIp = '10.247.143.138';

  static String get baseUrl {
    if (_override.isNotEmpty) return _override;
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://$_hostIp:8081';
    }
    return 'http://localhost:8081';
  }

  static String get registrasi => baseUrl + '/registrasi';
  static String get login => baseUrl + '/login';
  static String get listProduk => baseUrl + '/produk';
  static String get createProduk => baseUrl + '/produk';

  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String showProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }
}

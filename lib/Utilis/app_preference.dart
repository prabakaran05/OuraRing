import 'package:get_storage/get_storage.dart';

class AppPreference {
  static const STORAGE_NAME = 'OuraRing';
  static const RING_TOKEN = 'RING_TOKEN';


  static const leadEvaluationStatusLabel = "feature_permission_lead_evaluation";

  final _storage = GetStorage(STORAGE_NAME);

  Future<void> init() async {
    await _storage.initStorage;
  }

  updateMobileNumber(String ringToken) {
    _storage.write(RING_TOKEN, ringToken);
  }

  String get ringToken {
    try {
      return _storage.read(RING_TOKEN);
    } catch (e) {
      return "";
    }
  }


  void clearData() {
    _storage.erase();
  }
}

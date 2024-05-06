import 'baseNetwork.dart';

class UserData {
  static UserData instance = UserData();
  Future<Map<String, dynamic>> loadData(id) {
    return BaseNetwork.get(
      "users/${id}"
    );
  }
}
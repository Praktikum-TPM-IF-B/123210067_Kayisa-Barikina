import 'dart:convert';
import 'package:http/http.dart' as http;

class AmiiboData {
  static AmiiboData instance = AmiiboData();
  Future<List<dynamic>> loadAllData() async {
    const String fullUrl = ' https://www.amiiboapi.com/docs';
    final response = await http.get(Uri.parse(fullUrl));
    final body = response.body;
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> loadData(id) async {
    String fullUrl = ' https://www.amiiboapi.com/docs/$id';
    final response = await http.get(Uri.parse(fullUrl));
    final body = response.body;
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> loadGambar(id) async {
    String fullUrl = 'https://www.amiiboapi.com/docs/$id/photos';
    final response = await http.get(Uri.parse(fullUrl));
    final body = response.body;
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

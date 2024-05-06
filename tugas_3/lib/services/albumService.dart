import 'dart:convert';
import 'package:http/http.dart' as http;

class AlbumData {
  static AlbumData instance = AlbumData();
  Future<List<dynamic>> loadAllData()async{
    const String fullUrl = 'https://jsonplaceholder.typicode.com/albums';
    final responseAlbums = await http.get(Uri.parse(fullUrl));
    final body = responseAlbums.body;
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> loadAlbum(id) async {
    String fullUrl = 'https://jsonplaceholder.typicode.com/albums/$id';
    final responseAlbums = await http.get(Uri.parse(fullUrl));
    final body = responseAlbums.body;
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> loadGambar(id) async {
    String fullUrl = 'https://jsonplaceholder.typicode.com/albums/$id/photos';
    final responseAlbums = await http.get(Uri.parse(fullUrl));
    final body = responseAlbums.body;
    if (body.isNotEmpty) {
      return json.decode(body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
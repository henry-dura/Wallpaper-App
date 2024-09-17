import 'package:http/http.dart' as http;
import 'dart:convert';
import '../secrets/secret.dart';
import 'data_model.dart';

class ApiProvider{

  Future<WallpaperModel> fetchPhotos(String category) async {
    const String apiKey = key; // Replace with your actual API key
    final Uri url = Uri.parse('https://api.pexels.com/v1/search?query=$category&per_page=50');

    final response = await http.get(
      url,
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return WallpaperModel.fromJson(jsonDecode(response.body));
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to fetch wallpapers ${response.body}');
    }

  }
}



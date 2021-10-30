import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unsplash/Model/UnsplashImage.dart';

class Services {
  final String url =
      "https://api.unsplash.com/photos/?client_id=<AQUI VA EL APP ID CUANDO REGISTRAS EN DEMO TU APP>";

  // Checa este video para que sepas el APP ID y el client_id.... https://www.youtube.com/watch?v=95wNOAoSyaQ&t=338s

  // Create a Singleton pattern
  static final Services _shared = Services._internal();
  factory Services() {
    return _shared;
  }

  Services._internal();

  // Get json data from unsplash.com

  Future<List<UnsplashImage>> getData() async {
    List<UnsplashImage> urlList = [];

    final parseUrl = Uri.parse(url);
    final response = await http.get(parseUrl);

    if (response.statusCode != 200) {
      return urlList;
    }

    urlList = getDataFromJson(response.body);
    return urlList;
  }

  // Parse the json file and return a list of urls
  List<UnsplashImage> getDataFromJson(String jsonData) {
    final listMaps = json.decode(jsonData) as List;
    final List<UnsplashImage> listImages =
        listMaps.map((map) => UnsplashImage.fromMap(map)).toList();
    return listImages;
  }
}

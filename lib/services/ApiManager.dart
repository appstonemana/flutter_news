import 'dart:convert';

import 'package:flutter_app1/models/newsInfo.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<Welcome> getNes() async {
    var client = http.Client();
    var newsModel = null;

    try {
      var response = await client.get(
          'http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=6cd4cc56897c46e7be3b6f1bfe8c9953');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}

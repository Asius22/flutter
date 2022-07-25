import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:first_application_state/src/models/photo_model.dart';

class PhotoFetcher {
  List<PhotoModel> _parsePhotos(String response) {
    final parsed = jsonDecode(response).cast<Map<String, dynamic>>();

    return parsed.map<PhotoModel>((json) => PhotoModel.fromJson(json)).toList();
  }

  Future<List<PhotoModel>> fetch(http.Client client) async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    return compute(_parsePhotos, response.body);
  }
}

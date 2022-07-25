import 'dart:convert';

import 'package:http/http.dart' as http;

class ShoppingListRepository {
  ShoppingListRepository(this.client);

  final http.Client client;

  Future<String> fetchData() async {
    final response =
        await client.get(Uri.https('fakestoreapi.com', 'products'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          "${response.statusCode} : Si è verificato un problema durante il fetching dei dati");
    }
  }

  Future<Map<String, dynamic>> fetchDecodedData() async {
    final response = await client.get(Uri.https(
      'fakestoreapi.com',
      'products',
    ));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "${response.statusCode} : Si è verificato un problema durante il fetching dei dati ");
    }
  }
}

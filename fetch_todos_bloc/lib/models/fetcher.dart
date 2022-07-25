import 'package:http/http.dart' as http;

class Fetcher {
  Fetcher({required this.client});

  final http.Client client;

  Future<String> fetchData() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (Exception(
          "Something went wrong during the fetching, error code ${response.statusCode}"));
    }
  }
}

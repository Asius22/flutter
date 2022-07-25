import 'package:first_application_state/src/models/photo_model.dart';
import 'package:first_application_state/src/resources/photo_fetch.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  final _provider = PhotoFetcher();

  Future<List<PhotoModel>> get fetchPhotos => _provider.fetch(http.Client());
}

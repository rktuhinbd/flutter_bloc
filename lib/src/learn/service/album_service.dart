import 'package:flutter_bloc_pro/src/learn/model/album.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'album_repository.dart';

class AlbumService implements AlbumsRepository {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String _albumUrl = '/albums';

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.https(_baseUrl, _albumUrl);

    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);

    return albums;
  }
}

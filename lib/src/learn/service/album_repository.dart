import 'package:flutter_bloc_pro/src/learn/model/album.dart';

abstract class AlbumsRepository {
  Future<List<Album>> getAlbumList();
}
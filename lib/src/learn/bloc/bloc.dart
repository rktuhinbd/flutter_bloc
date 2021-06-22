import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/event.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/state.dart';
import 'package:flutter_bloc_pro/src/learn/model/album.dart';
import 'package:flutter_bloc_pro/src/learn/service/album_repository.dart';

class AlbumBloc extends Bloc<AlbumEvents, AlbumState> {
  final AlbumsRepository albumsRepository;
  List<Album> albums;

  AlbumBloc({this.albumsRepository}) : super(AlbumsInitState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        albums = await albumsRepository.getAlbumList();
        yield AlbumsLoaded(albums : albums);
        break;

    }
  }
}

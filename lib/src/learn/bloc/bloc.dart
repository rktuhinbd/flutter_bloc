import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/event.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/state.dart';
import 'package:flutter_bloc_pro/src/learn/model/album.dart';
import 'package:flutter_bloc_pro/src/learn/service/album_repository.dart';
import 'package:flutter_bloc_pro/src/learn/service/network_exception.dart';

class AlbumBloc extends Bloc<AlbumEvents, AlbumState> {
  final AlbumsRepository albumsRepository;
  List<Album> albums;

  AlbumBloc({this.albumsRepository}) : super(InitAlbumsState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepository.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(
              error: NoInternetException("No Internet Connection"));
        } on HttpException {
          yield AlbumsListError(error: NoServiceException("No Service Found"));
        } on FormatException {
          yield AlbumsListError(
              error: InvalidFormatException("Invalid Response Format"));
        } catch (e) {
          yield AlbumsListError(error: UnknownException("Unknown Error"));
        }
        break;
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pro/src/learn/model/album.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumState {}

class AlbumsLoading extends AlbumState {}

class AlbumsLoaded extends AlbumState {
  final List<Album> albums;
  AlbumsLoaded({this.albums});
}

class AlbumsListError extends AlbumState {
  final error;
  AlbumsListError({this.error});
}

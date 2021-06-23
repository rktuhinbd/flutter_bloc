import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/bloc.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/event.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/state.dart';
import 'package:flutter_bloc_pro/src/learn/model/album.dart';
import 'package:flutter_bloc_pro/src/learn/ui/album_data_list.dart';
import 'package:flutter_bloc_pro/src/learn/ui/service_error.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    BlocProvider.of<AlbumBloc>(context).add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Flutter BLOC"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 24.0, 24.0, 0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<AlbumBloc, AlbumState>(
                    builder: (BuildContext context, AlbumState state) {
                  if (state is AlbumsListError) {
                    final error = state.error;
                    String errorMessage = "${error.message}\nTap to retry";
                    return NetworkError(
                        message: errorMessage, onTap: _loadAlbums());
                  }

                  if (state is AlbumsLoaded) {
                    List<Album> albums = state.albums;
                    return _albumListWidget(albums);
                  }
                  return CircularProgressIndicator();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _albumListWidget(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: albums.length,
        itemBuilder: (BuildContext _context, int index) {
          Album album = albums[index];
          return AlbumDataList(album: album);
        },
      ),
    );
  }
}

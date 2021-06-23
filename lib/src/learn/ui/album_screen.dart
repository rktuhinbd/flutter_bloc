import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/bloc.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/event.dart';
import 'package:flutter_bloc_pro/src/learn/bloc/state.dart';
import 'package:flutter_bloc_pro/src/learn/model/album.dart';

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
    // context.bloc<AlbumBloc>().add(AlbumEvents.fetchAlbums);
    BlocProvider.of<AlbumBloc>(context).add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BLOC"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 24.0, 0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<AlbumBloc, AlbumState>(
                    builder: (BuildContext context, AlbumState state) {
                  if (state is AlbumsListError) {
                    return Text("Error");
                  }

                  if (state is AlbumsLoaded) {
                    List<Album> albums = state.albums;
                    print("Album data: ${albums.length}");
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
    albums.forEach((element) {
      print(element.title);
    });
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: albums.length,
        itemBuilder: (BuildContext _context, int index) {
          Album album = albums[index];
          return new Card(
            child: new Column(
              children: [
                new Image.network(
                    'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Row(
                    children: [
                       new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Text(
                            album.title,
                            style: new TextStyle(fontSize: 18.0),
                          ),
                        ),
                    ],
                    
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

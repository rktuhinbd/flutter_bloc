import 'package:flutter/material.dart';
import 'package:flutter_bloc_pro/src/learn/model/album.dart';

class AlbumDataList extends StatelessWidget {
  Album album;

  AlbumDataList({this.album});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User ID: ${album.userId}",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Text(
            "Title: ${album.title}",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          Divider()
        ],
      ),
    );
  }
}

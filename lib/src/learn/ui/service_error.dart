import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  final String message;

  NetworkError({this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
            child: Text(
          message,
          style: TextStyle(
              color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
    );
  }
}

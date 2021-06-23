import 'package:flutter/material.dart';

class NetworkError extends StatelessWidget {
  final String message;
  final Function onTap;

  NetworkError({this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
              child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
        ),
      ),
    );
  }
}

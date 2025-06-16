import 'dart:io';

import 'package:flutter/material.dart';

import '../result.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, this.serverError, this.exception});

  final ServerError? serverError;
  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    print(serverError);
    print(exception);
    return Center(
      child: Text(extractErrorMessage(), style: TextStyle(color: Colors.white)),
    );
  }

  String extractErrorMessage() {
    String message = "Error";
    if (serverError != null) {
      message = serverError!.message;
      return message;
    }
    Exception myEx = exception as Exception;
    print("My Exc: ${myEx}");

    if (myEx is SocketException) {
      message = 'No Internet connection 😑';
      return message;
    }

    if (myEx is HttpException) {
      message = "Couldn't find the post 😱";
      return message;
    }
    if (myEx is FormatException) {
      message = "Bad response format 👎";
      return message;
    }
    return message;
  }
}

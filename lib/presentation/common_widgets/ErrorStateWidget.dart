

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';




class ErrorStateWidget extends StatelessWidget {
  Exception? exception;
  String? retryButtonText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget(this.exception,
      {this.retryButtonText, this.retryButtonAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(extractErrorMessage()),
          retryButtonText != null ? ElevatedButton(onPressed: retryButtonAction,
              child: Text(retryButtonText ?? ""))
              : const Text('')
        ],
      ),
    );
  }

  String extractErrorMessage() {
    switch (exception) {
      case TimeoutException() :
        {
          return "No internet Connection";
        }
      case SocketException() :
        {
          return "Please Check internet Connection";
        }

      default:
        {
          return "Something Went Wrong";
        }
    }
  }

}

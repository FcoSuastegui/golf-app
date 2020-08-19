import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {

  Debouncer._internal();
  static Debouncer _instance = Debouncer._internal();
  static Debouncer get instance => _instance;

  Timer _timer;
  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(
      Duration(
        milliseconds: 500,
      ),
      callback,
    );
  }
}

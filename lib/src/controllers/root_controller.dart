import 'dart:async';

import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/helpers/get_storages.dart';
import 'package:clubgolf/src/helpers/helper.dart';
import 'package:clubgolf/src/routes/routes.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RootController extends GetxController {
  static final RootController _instancia = new RootController._internal();
  factory RootController() => _instancia;
  RootController._internal();

  String _title = 'Club De Golf';
  String get title => _title;

  Transition _defaultTransition = Transition.cupertino;
  Transition get defaultTransition => _defaultTransition;

  bool _debugShowCheckedModeBanner = false;
  bool get debugShowCheckedModeBanner => _debugShowCheckedModeBanner;

  String _initialRoute = GetStorages.inst.page;
  String get initialRoute => _initialRoute;

  List<GetPage> _getPages = Routes.inst.routes;
  List<GetPage> get getPages => _getPages;

  ThemeData _theme = ThemeData(
    textTheme: GoogleFonts.quicksandTextTheme(),
    primaryColor: CustomColors.primaryColor,
    backgroundColor: CustomColors.secondColor,
  );

  ThemeData get theme => _theme;

  Locale _locale = Locale('es');
  Locale get locale => _locale;

  Iterable<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      _localizationsDelegates;

  Iterable<Locale> _supportedLocales = [
    const Locale('es'), // Español
    const Locale('en'), // English
  ];

  Iterable<Locale> get supportedLocales => _supportedLocales;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  RxBool _isConnect = true.obs;
  RxBool get isConnect => _isConnect;

  @override
  void onInit() async {
    /* await initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus); */
    super.onInit();
  }

  @override
  Future<void> onClose() {
    _connectivitySubscription.cancel();
    return super.onClose();
  }

  Future<void> initConnectivity() async {
    try {
      ConnectivityResult result = await _connectivity.checkConnectivity();
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          break;
        case ConnectivityResult.none:
          Helper.error(message: 'Sin conexión internet');
          break;
      }
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  /* Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        Helper.success(message: 'Conexión de internet estable');
        break;
      case ConnectivityResult.mobile:
        Helper.success(message: 'Conexión de internet estable');
        break;
      case ConnectivityResult.none:
        Helper.error(message: 'Sin conexión internet');
        break;
    }
  } */
}

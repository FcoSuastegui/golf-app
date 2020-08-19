import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:clubgolf/src/pages/principal_page.dart';
import 'package:clubgolf/src/pages/login_page.dart';

import 'package:clubgolf/src/pages/hoyos/hoyos_page.dart';
import 'package:clubgolf/src/pages/informacion/informacion_page.dart';
import 'package:clubgolf/src/pages/invitados/invitados_page.dart';
import 'package:clubgolf/src/pages/reservaciones/reservaciones_page.dart';
import 'package:clubgolf/src/pages/score-card/score_card_page.dart';
import 'package:clubgolf/src/pages/tee-time/teetime_page.dart';

class Routes {
  static final Routes _instancia = new Routes._internal();
  factory Routes() => _instancia;
  Routes._internal();

  static final routes = [
    GetPage(
      name: LoginPage.routeName,
      page: () => LoginPage(),
    ),
    GetPage(
      name: PrincipalPage.routeName,
      page: () => PrincipalPage(),
      transition: Transition.cupertino,
    ),
  ];

  static getRoute(String route, {bool isTo = true, bool isNamed = false}) {
    Map<String, dynamic> page = {
      'invitados': InvitadosPage(),
      'reservaciones': ReservacionesPage(),
      'score-card': ScoreCardPage(),
      'tee-time': TeeTimePage(),
      'informacion': InformacionPage(),
      'hoyos': HoyosPage(),
    };
    page[route] == null
        ? Get.snackbar(
            "Club de Golf",
            "No se ha implementado el modulo",
            backgroundColor: Colors.red.withOpacity(0.8),
          )
        : Get.to(page[route]);
  }
}

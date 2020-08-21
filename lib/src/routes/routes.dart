import 'package:clubgolf/src/pages/configuracion/configuracion_page.dart';
import 'package:clubgolf/src/pages/notificacion/notificacion_page.dart';
import 'package:clubgolf/src/pages/servicios/servicios_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Rutas con nombres
import 'package:clubgolf/src/pages/home_page.dart';
import 'package:clubgolf/src/pages/login_page.dart';

// Rutas dinamicas con navigation bar
import 'package:clubgolf/src/pages/home/home_screen.dart';
import 'package:clubgolf/src/pages/campo/campo_screen.dart';

// Rutas push
import 'package:clubgolf/src/pages/campo/hoyos/hoyos_screen.dart';
import 'package:clubgolf/src/pages/campo/informacion/informacion_screen.dart';
import 'package:clubgolf/src/pages/campo/invitados/invitados_screen.dart';
import 'package:clubgolf/src/pages/campo/reservaciones/reservaciones_screen.dart';
import 'package:clubgolf/src/pages/campo/score-card/score_card_screen.dart';
import 'package:clubgolf/src/pages/campo/tee-time/teetime_screen.dart';

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
      name: HomePage.routeName,
      page: () => HomePage(),
      transition: Transition.cupertino,
    ),
  ];

  static getRoute(String route ) {
    Map<String, dynamic> page = {
      'invitados': InvitadoScreen(),
      'reservaciones': ReservacionScreen(),
      'score-card': ScoreCardScreen(),
      'tee-time': TeeTimeScreen(),
      'informacion': InformacionScreen(),
      'hoyos': HoyoScreen(),
    };
    page[route] == null
        ? Get.snackbar(
            "Club de Golf",
            "No se ha implementado el modulo",
            backgroundColor: Colors.red.withOpacity(0.8),
          )
        : Get.to(page[route]);
  }

  static Widget campoRoute(int index) {
    List<Widget> list = [
      CampoScreen(),
      ServiciosPage(),
      NotificacionPage(),
      ConfiguracionPage(),
    ];
    
    int indexAux = index + 1;
    return list.length >= indexAux ? list[index] : CampoScreen();

  }

  static Widget homeRoute(int index) {
    List<Widget> list = [
      HomeScreen(),
      NotificacionPage(),
      ConfiguracionPage(),
    ];
    int indexAux = index + 1;
    return list.length >= indexAux ? list[index] : HomeScreen();
  }
}

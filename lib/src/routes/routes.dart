import 'package:get/get.dart';
import 'package:clubgolf/src/pages/principal/principal_page.dart';
import 'package:clubgolf/src/pages/login_page.dart';

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
      transition: Transition.cupertino,
      page: () => PrincipalPage(),
    ),
  ];
}

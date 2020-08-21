import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/routes/routes.dart';
import 'package:clubgolf/src/widgets/NavigationBar/navigation_bar.dart';
import 'package:clubgolf/src/widgets/NavigationBar/navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static final routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>(
      init: NavigationBarController.instance,
      builder: (_) => Obx(() {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Routes.homeRoute(_.indexHome.value),
          bottomNavigationBar: NavigationBar(
            theme: NavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: Colors.white,
              selectedItemBackgroundColor: CustomColors.iconColor,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
              showSelectedItemShadow: true,
            ),
            selectedIndex: _.indexHome.value,
            onSelectTab: _.selectIndexHome,
            items: [
              NavigationBarItem(
                iconData: Icons.home,
                label: 'Inicio',
              ),
/*               NavigationBarItem(
                iconData: Icons.style,
                label: 'Servicios',
              ), */
              NavigationBarItem(
                iconData: Icons.notifications,
                label: 'Notificaciones',
              ),
              NavigationBarItem(
                iconData: Icons.settings,
                label: 'Configuración',
              ),
            ],
          ),
        );
      }),
    );
  }
}

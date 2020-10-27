import 'package:badges/badges.dart';
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
      init: NavigationBarController(),
      builder: (_) => Obx(() {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Routes.inst.homeRoute(_.indexHome.value),
          bottomNavigationBar: NavigationBar(
            theme: NavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: Colors.white,
              selectedItemBackgroundColor: CustomColors.primaryColor,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
              showSelectedItemShadow: false,
            ),
            selectedIndex: _.indexHome.value,
            onSelectTab: _.selectIndexHome,
            items: [
              NavigationBarItem(
                iconData: Icons.home,
                label: 'Inicio',
              ),
              NavigationBarItem(
                iconWidget: Badge(
                  badgeContent: Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: _.indexHome.value == _.notificacionHome
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
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

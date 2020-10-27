import 'package:badges/badges.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/routes/routes.dart';
import 'package:clubgolf/src/widgets/NavigationBar/navigation_bar.dart';
import 'package:clubgolf/src/widgets/NavigationBar/navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>(
      init: NavigationBarController(),
      builder: (_) => Obx(
        () {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.white,
              body: Routes.inst.campoRoute(_.indexCampo.value),
              bottomNavigationBar: NavigationBar(
                theme: NavigationBarTheme(
                  barBackgroundColor: Colors.white,
                  selectedItemBorderColor: Colors.white,
                  selectedItemBackgroundColor: CustomColors.primaryColor,
                  selectedItemIconColor: Colors.white,
                  selectedItemLabelColor: Colors.black,
                  showSelectedItemShadow: false,
                ),
                selectedIndex: _.indexCampo.value,
                onSelectTab: _.selectIndexCampo,
                items: [
                  NavigationBarItem(
                    iconData: Icons.home,
                    label: 'Inicio',
                    itemWidth: 10,
                  ),
                  NavigationBarItem(
                    iconData: Icons.style,
                    label: 'Servicios',
                    itemWidth: 10,
                  ),
                  NavigationBarItem(
                    iconWidget: Badge(
                      badgeContent: Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: _.indexCampo.value == _.notificacionCampo
                            ? Colors.white
                            : Colors.grey,
                      ),
                    ),
                    label: 'Notificaciones',
                    itemWidth: 10,
                  ),
                  NavigationBarItem(
                    iconData: Icons.settings,
                    label: 'Configuración',
                    itemWidth: 5,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

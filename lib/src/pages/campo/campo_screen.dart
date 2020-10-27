import 'package:clubgolf/src/controllers/club_controller.dart';
import 'package:clubgolf/src/controllers/home_controller.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/helpers/icon.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:clubgolf/src/routes/routes.dart';
import 'package:clubgolf/src/widgets/Cards/card_custom_widget.dart';
import 'package:clubgolf/src/widgets/NavigationBar/navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _clubController = ClubController();
    final CamposModel _campoSeleccionado =
        Get.find<HomeController>().campoSeleccionado;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: _campoSeleccionado.field,
                    child: Container(
                      margin: EdgeInsets.only(top: 0.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_campoSeleccionado.images.first),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [Colors.teal[800], Colors.teal[200]],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    top: 40.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          Get.find<NavigationBarController>().backHome(),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "${_campoSeleccionado.field} - ${_campoSeleccionado.enterprise}",
                        style: TextStyle(
                          color: CustomColors.primaryColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            _clubController.firtsItems.length,
                            (index) {
                              final firsItem =
                                  _clubController.firtsItems[index];
                              return CardCustomWidget(
                                text: firsItem.title,
                                icon: Iconos.instance.nombre(
                                  nombre: firsItem.icon,
                                  color: CustomColors.iconColor,
                                  size: 40.0,
                                ),
                                onPress: () =>
                                    Routes.inst.getRoute(firsItem.page),
                                left: 0.0,
                              );
                            },
                          ),
                        );
                      }),
                    ),
                    GetBuilder<ClubController>(
                      init: _clubController,
                      builder: (_) => Obx(() {
                        return Column(
                          children: List.generate(
                            _.secondItems.length,
                            (index) {
                              final seconItem = _.secondItems[index];
                              return GestureDetector(
                                onTap: () =>
                                    Routes.inst.getRoute(seconItem.page),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1.0,
                                        color: Colors.black.withOpacity(.2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 80.0,
                                        width: 80.0,
                                        margin: EdgeInsets.only(left: 0.0),
                                        child: Iconos.instance.nombre(
                                          nombre: seconItem.icon,
                                          color: CustomColors.iconColor,
                                          size: 50,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: Get.width,
                                          margin: EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  seconItem.title,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10.0),
                                                child: Text(
                                                  seconItem.subtitle,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

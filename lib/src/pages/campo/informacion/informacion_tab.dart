import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/pages/campo/informacion/informacion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InformacionTab extends StatelessWidget {
  const InformacionTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    return GetBuilder<InformacionController>(
      init: InformacionController(),
      builder: (_) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: height * 0.20,
                enableInfiniteScroll: false,
                viewportFraction: 0.95,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: _.campoSeleccionado.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(i),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      _.campoSeleccionado.field,
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      _.campoSeleccionado.enterprise,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _.onLeearMas,
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Obx(() {
                        return _.secondText.value == ""
                            ? Text(
                                _.firstText.value,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            : RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: !_.leerMas.value 
                                          ? _.firstText.value : _.firstText.value + _.secondText.value,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    TextSpan(
                                      text: !_.leerMas.value ? " Leer mas" : "",
                                      style: TextStyle(
                                        color: CustomColors.primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Hora de apertura:",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0, right: 10.0),
                          child: Text(
                            "Hora de cierre:",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "08:00 h",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0, right: 10.0),
                          child: Text(
                            "20:00 h",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Intervarlos de Tee Time:",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Cada 20 min.",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

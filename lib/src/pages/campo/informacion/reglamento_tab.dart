import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/pages/campo/informacion/informacion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReglamentoTab extends StatelessWidget {
  const ReglamentoTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InformacionController>(
      init: InformacionController(),
      builder: (_) => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    "Reglamento",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    _.campoSeleccionado.regulation,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ]
            )
          )
        ]
      )
      )
    );
  }
}
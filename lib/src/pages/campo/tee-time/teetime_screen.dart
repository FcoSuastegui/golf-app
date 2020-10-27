import 'package:clubgolf/src/pages/campo/tee-time/teetime_controller.dart';
import 'package:clubgolf/src/routes/routes.dart';
import 'package:clubgolf/src/widgets/ListTile/listTileCustom.dart';
import 'package:clubgolf/src/widgets/Scaffold/scaffold_template_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class TeeTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeeTimeController>(
      builder: (_) => ScaffoldTemplateWidget(
        title: 'Tee Time',
        leading: Icons.arrow_back,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            onPressed: () => Routes.inst.getRoute('tee-time-add'),
          )
        ],
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ListView(
            padding: EdgeInsets.only(top: 0.0),
            shrinkWrap: false,
            children: List.generate(
              10,
              (index) => ListTileCustom(
                text: 'Reservación con folio ${index + 1}',
                bottom: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

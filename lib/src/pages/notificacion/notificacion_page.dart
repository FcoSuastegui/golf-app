import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/widgets/ListTile/list_tile_notification_custom.dart';
import 'package:clubgolf/src/widgets/Scaffold/scaffold_template_widget.dart';
import 'package:flutter/material.dart';

class NotificacionPage extends StatelessWidget {
  const NotificacionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      title: 'Mis notificciones',
      body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ListView(
            padding: EdgeInsets.only(top: 0.0),
            shrinkWrap: false,
            children: List.generate(
              10,
              (index) => ListTileNotificationCustom(
                leading: Icon(Icons.done, color: CustomColors.iconColor),
                text: 'Notificación con folio ${index + 1}',
                bottom: 10.0,
              ),
            ),
          ),
        ),
    );
  }
}

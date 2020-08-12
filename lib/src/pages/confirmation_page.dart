import 'package:flutter/material.dart';


class ConfirmationPage extends StatelessWidget {
  final IconData icon;
  final String title, subtitle, textIcon;
  final Widget body;
  final Function onTap;

  ConfirmationPage({
    Key key, 
    this.icon = Icons.error_outline, 
    @required this.title, 
    this.subtitle,
    this.textIcon, 
    this.body, 
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body,
    );
  }
}
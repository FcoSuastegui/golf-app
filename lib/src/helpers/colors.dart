import 'package:flutter/material.dart';

class CustomColors {

  static final CustomColors _instancia = new CustomColors._internal();
  factory CustomColors() => _instancia; 
  CustomColors._internal();

  static const Color primaryColor           = Color(0xff004E41);
  static const Color secondColor            = Color(0xff014375);
  static const Color iconColor              = Color(0xff014375);

  static const Color backColor              = Color(0xff004E41);
  
  static Color borderColor                  = Colors.teal[200];

  static Color buttonColor                  = Colors.teal[200];


}
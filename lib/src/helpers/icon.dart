import 'package:flutter/material.dart';

class Iconos {

  Iconos._internal();
  static Iconos _instance = Iconos._internal();
  static Iconos get instance => _instance;

  Icon nombre({String nombre = 'home', double size = 25.0, Color color =  Colors.white} )  {
    Map <String, dynamic> iconos = {
        'home'                : Icon(Icons.home, color: color, size: size),
        'person_outline'      : Icon(Icons.person_outline, color: color, size: size),
        'announcement'        : Icon(Icons.announcement, color: color, size: size),
        'attach_money'        : Icon(Icons.attach_money, color: color, size: size),
        'assignment'          : Icon(Icons.assignment, color: color, size: size),
        'thumbs_up_down'      : Icon(Icons.thumbs_up_down, color: color, size: size),
        'library_books'       : Icon(Icons.library_books, color: color, size: size),
        'exit_to_app'         : Icon(Icons.exit_to_app, color: color, size: size),
        'cake'                : Icon(Icons.cake, color: color, size: size),
        'monetization_on'     : Icon(Icons.monetization_on, color: color, size: size),
        'settings'            : Icon(Icons.settings, color: color, size: size),
        'attach_file'         : Icon(Icons.attach_file, color: color, size: size),
        'insert_invitation'   : Icon(Icons.insert_invitation, color: color, size: size),
        'import_contacts'     : Icon(Icons.import_contacts, color: color, size: size),
        'supervisor_account'  : Icon(Icons.supervisor_account, color: color, size: size),
        'filter_9_plus'       : Icon(Icons.filter_9_plus, color: color, size: size),
        'stars'               : Icon(Icons.stars, color: color, size: size),
        'golf_course'         : Icon(Icons.golf_course, color: color, size: size),
    };
    
    return iconos[nombre];
  }
}
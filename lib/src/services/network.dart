import 'package:dio/dio.dart';

class Network {

  static String _urlBase = 'https://qa.timeshareapp.com/api';
  // Servicios 
  static postFormData(String route, Map data) async => await Dio().post("$_urlBase/$route", data: FormData.fromMap(data));
  
}
import 'package:dio/dio.dart';

class Network {

  Network._internal();
  static Network _instance = Network._internal();
  static Network get instance => _instance;

  String _servidor = 'https://qa.timeshareapp.com';
  String _api = "api/app/club-golf";
  
  final Dio _dio = Dio();
  // Servicios 
  postFormData({ String route, Map<String, dynamic> data }) async => await _dio.post("$_servidor/$_api/$route", data: FormData.fromMap(data) );
  post({ String route, Map<String, dynamic> data }) async => await _dio.post("$_servidor/$_api/$route", data: data );
  get(String route) async => await _dio.get("$_servidor/$_api/$route");
  
}
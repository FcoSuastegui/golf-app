import 'package:clubgolf/src/helpers/debouncer.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:clubgolf/src/services/network.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  // Patron Singleton
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get instance => _instance;

  RxList<CamposModel> _campos = List<CamposModel>().obs;
  RxList get campos => _campos;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  CamposModel _campoSeleccionado;
  CamposModel get campoSeleccionado => _campoSeleccionado;



  @override
  void onInit() {
    super.onInit();
    _camposApi('');
  }

  void seleccionarCampo(CamposModel campo ) => _campoSeleccionado = campo;

  void searchClub(String text) {
    Debouncer.instance.run(() async {
      print("Escribiendo $text");
      await _camposApi(text);
    });
  }

  Future<void> _camposApi(String text) async {
    _loading.value = true;
    final Response response =
        await Network.instance.post(route: 'campos', data: {"search": text});
    if (response.statusCode == 200) {
      _campos.value = [];
      response.data['data'].forEach((item) {
        _campos.add(CamposModel.fromJson(item));
      });
    }
    _loading.value = false;
  }
}

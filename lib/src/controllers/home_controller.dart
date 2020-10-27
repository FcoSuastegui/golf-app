import 'package:clubgolf/src/helpers/debouncer.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:clubgolf/src/routes/routes.dart';
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
  void onInit() async {
    super.onInit();
    await _campoSearch('');
  }

  void seleccionarCampo(CamposModel campo) {
    _campoSeleccionado = campo;
    Routes.inst.getRoute('campo');
  }

  void searchClub(String text) {
    Debouncer.instance.run(() async {
      print("Escribiendo $text");
      await _campoSearch(text);
    });
  }

  Future<void> _campoSearch(String text) async {
    _loading.value = true;
    _campos.length == 0 || text.trim().isEmpty
        ? await _camposApi(text)
        : await _camposList(text);
    _loading.value = false;
  }

  Future<void> _camposList(String text) async {
    await Future.delayed(Duration(milliseconds: 200));
    _campos.value = _campos
        .where((item) =>
            item.field.toLowerCase().trim().startsWith(text.toLowerCase()))
        .toList();
  }

  Future<void> _camposApi(String text) async {
    try {
      final Response response = await Network.instance.post(
        route: 'campos',
        data: {"search": text},
      );
      if (response.statusCode == 200) {
        _campos.clear();
        response.data['data'].forEach((item) {
          _campos.add(CamposModel.fromJson(item));
        });
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 400) {
        print("$e");
      }
      print("$e");
    }
  }
}

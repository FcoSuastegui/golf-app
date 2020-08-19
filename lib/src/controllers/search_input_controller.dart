import 'package:clubgolf/src/helpers/debouncer.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:clubgolf/src/services/network.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class SearchInputController extends GetxController {
  // Patron Singleton
  SearchInputController._internal();
  static SearchInputController _instance = SearchInputController._internal();
  static SearchInputController get instance => _instance;

  RxList<CamposModel> _campos = List<CamposModel>().obs;
  RxList get campos => _campos;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    _camposApi('');
  }

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

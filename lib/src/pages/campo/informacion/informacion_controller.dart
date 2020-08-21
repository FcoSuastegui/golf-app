import 'package:clubgolf/src/controllers/home_controller.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:get/get.dart';

class InformacionController extends GetxController {
  CamposModel _campoSeleccionado; 
  CamposModel get campoSeleccionado => _campoSeleccionado;

  RxBool _leerMas = false.obs;
  RxBool get leerMas => _leerMas;

  String _firstText = "";
  String get firstText => _firstText;

  String _secondText = "";
  String get secondText => _secondText;


  @override
  void onInit() {
    super.onInit();
    _campoSeleccionado = Get.find<HomeController>().campoSeleccionado;

    if(_campoSeleccionado.description.length > 150 ) {
      _firstText = _campoSeleccionado.description.substring(0, 150);
      _secondText = _campoSeleccionado.description.substring(150, _campoSeleccionado.description.length);
    } else {
      _firstText = _campoSeleccionado.description;
      _secondText = "";
    }
  }

  void onLeearMas() => _leerMas.value = !leerMas.value;



  
}

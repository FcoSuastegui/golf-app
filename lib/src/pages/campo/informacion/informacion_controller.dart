import 'package:clubgolf/src/controllers/home_controller.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:get/get.dart';

class InformacionController extends GetxController {
  static final InformacionController _instancia = new InformacionController._internal();
  factory InformacionController() => _instancia;
  InformacionController._internal();

  CamposModel _campoSeleccionado = Get.find<HomeController>().campoSeleccionado; 
  CamposModel get campoSeleccionado => _campoSeleccionado;

  RxBool _leerMas = false.obs;
  RxBool get leerMas => _leerMas;

  RxString _firstText = "".obs;
  RxString get firstText => _firstText;

  RxString _secondText = "".obs;
  RxString get secondText => _secondText;


  @override
  void onInit() {
    super.onInit();
    if(_campoSeleccionado.description.length > 150 ) {
      _firstText.value = _campoSeleccionado.description.substring(0, 150);
      _secondText.value = _campoSeleccionado.description.substring(150, _campoSeleccionado.description.length);
    } else {
      _firstText.value = _campoSeleccionado.description;
      _secondText.value = "";
    }
  }

  void onLeearMas() => _leerMas.value = !leerMas.value;



  
}

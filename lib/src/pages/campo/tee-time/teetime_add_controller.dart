import 'package:clubgolf/src/helpers/helper.dart';
import 'package:get/get.dart';

class TeeTimeAddController extends GetxController {
  
  RxList<String> _jugadores = [
    "Yo soy el jugador 1",
    "Juan Perez Garcia",
    "Francisco javier",
    'Miguel angel',
  ].obs;

  RxList<String> get juagadores => _jugadores;

  RxList<String> _horarios = [
    "8:00 h",
    "8:20 h",
    "8:40 h",
    '9:00 h',
  ].obs;

  RxList<String> get horarios => _horarios;

  RxList<String> _hoyos = [
    "9 hoyos",
    "18 hoyos",
  ].obs;

  RxList<String> get hoyos => _hoyos;

  RxList<String> _jugadoreSeleccionado = <String>[].obs;
  RxList<String> get jugadoreSeleccionado => _jugadoreSeleccionado;

  @override
  void onInit() {
    asignarJugador1();
    super.onInit();
  }

  void seleccionarJugador(String jugador) =>
      _jugadoreSeleccionado.contains(jugador)
          ? Helper.error(message: "El jugador $jugador ya existe en la lista")
          : _jugadoreSeleccionado.add(jugador);

  void eliminarJugador(int index) {
    _jugadoreSeleccionado.length <= 1 
      ? Helper.error(message: "Debe tener un jugador en la lista",)
      : jugadoreSeleccionado.removeAt(index);
  }

  void asignarJugador1() => _jugadoreSeleccionado.add(_jugadores.first);
}

import 'package:get_storage/get_storage.dart';

class GetStorages {
  GetStorages._internal();
  static GetStorages _instance = GetStorages._internal();
  static GetStorages get inst => _instance;

  GetStorage _storage = GetStorage();

  // Métodos de getStorage
  Future<void> init() async => await GetStorage.init();
  Future<void> clear() async => await _storage.erase();

  // Setter y getters de datos

  set server(String valor) => _storage.write('server', valor);
  String get server => _storage.read('server') ?? 'https://qa.timeshareapp.com';

  set api(String valor) => _storage.write('api', valor);
  String get api => _storage.read('api') ?? "$server/api/app/club-golf";

  set page(String valor) => _storage.write('page', valor);
  String get page => _storage.read('page') ?? '/';

  set sistema(int valor) => _storage.write('sistema', valor);
  int get sistema => _storage.read('sistema') ?? 0;

  set idusuario(int valor) => _storage.write('idusuario', valor);
  int get idusuario => _storage.read('idusuario') ?? 0;
  
  set mebresia(String valor) => _storage.write('mebresia', valor);
  String get mebresia => _storage.read('mebresia') ?? '';

  set avatar(String valor) => _storage.write('avatar', server + '/' + valor);
  String get avatar => _storage.read('avatar') ?? server + '/../site_media/assets/images/profile-image.png';
  
  set nombreCompleto(String valor) => _storage.write('nombreCompleto', valor);
  String get nombreCompleto => _storage.read('nombreCompleto') ?? '';
  
  set correo(String valor) => _storage.write('correo', valor);
  String get correo => _storage.read('correo') ?? '';

}

import 'package:get/get.dart';

class NavigationBarController extends GetxController {

  RxInt _indexHome = 0.obs;
  RxInt get indexHome => _indexHome;
  void selectIndexHome(int index) => _indexHome.value = index;

  int _notificacionHome = 1;
  int get notificacionHome => _notificacionHome;

  int _notificacionCampo = 2;
  int get notificacionCampo => _notificacionCampo;

  RxInt _indexCampo = 0.obs;
  RxInt get indexCampo => _indexCampo;
  void selectIndexCampo(int index) => _indexCampo.value = index;

  @override
  void onInit() {
    super.onInit();
  }

  void backHome() {
    Get.back();
  }
}

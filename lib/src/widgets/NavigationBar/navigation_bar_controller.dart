
import 'package:get/get.dart';

class NavigationBarController extends GetxController{

  NavigationBarController._internal();
  static NavigationBarController _instance = NavigationBarController._internal();
  static NavigationBarController get instance => _instance;

  RxInt _indexHome = 0.obs;
  RxInt get indexHome => _indexHome;
  void selectIndexHome( int index ) =>  _indexHome.value = index;

  RxInt _indexCampo = 0.obs;
  RxInt get indexCampo => _indexCampo;
  void selectIndexCampo( int index ) => _indexCampo.value = index;


  void backHome() {
    _indexCampo.value = 0;
    Get.back();
  }

}
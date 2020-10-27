
import 'package:clubgolf/src/models/item_model.dart';
import 'package:get/get.dart';

class ClubController extends GetxController{

  RxList<ItemModel> _firtsItems = [
    ItemModel(
      title: "Informacion",
      icon: "stars",
      page: "informacion"
    ),
    ItemModel(
      title: "Hoyos",
      icon: "golf_course",  
      page: "hoyoss"
    ),
  ].obs;

  RxList<ItemModel> get firtsItems => _firtsItems;


  RxList<ItemModel> _secondItems = [
    ItemModel(
      title: "Tee Time",
      subtitle: "Resereve el campo",
      icon: "insert_invitation",
      page: "tee-time"
    ),
   /*  ItemModel(
      title: "Reservaciones",
      subtitle: "Historial de reservaciones",
      icon: "import_contacts",
      page: "reservaciones"
    ), */
    ItemModel(
      title: "Mis invitados",
      subtitle: "Lista de invitados",
      icon: "supervisor_account",
      page: "invitados"
    ),
    ItemModel(
      title: "Score Card",
      subtitle: "Marcador de su juego",
      icon: "filter_9_plus",
      page: "score-card"
    ),
  ].obs;

  RxList<ItemModel> get secondItems => _secondItems;







}
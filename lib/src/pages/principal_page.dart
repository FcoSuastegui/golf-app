import 'package:clubgolf/src/controllers/search_input_controller.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/models/campos_model.dart';
import 'package:clubgolf/src/pages/campo/campo_page.dart';
import 'package:clubgolf/src/widgets/Search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrincipalPage extends StatelessWidget {
  static final routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final _searchController = SearchInputController.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.32,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/golf-3.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [Colors.teal[800], Colors.teal[200]],
                        ),
                      ),
                    ),
                    SearchBarWidget(
                      hintText: "Buscar campos..",
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text(
                    "Campos",
                    style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GetBuilder(
                  init: _searchController,
                  builder: (_) => Obx(
                    () => Container(
                      margin: EdgeInsets.only(left: 15.0),
                      width: MediaQuery.of(context).size.width,
                      child: _.loading.value
                          ? Center(child: CircularProgressIndicator())
                          : _.campos.value.length > 0
                              ? Column(
                                  children: List.generate(
                                    _.campos.value.length,
                                    (index) =>
                                        _campos(_.campos[index], context),
                                  ),
                                )
                              : Text(
                                  "No se encontro campos",
                                ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _campos(CamposModel campos, BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Get.to(
          CampoPage(
            campo: campos,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(right: 15.0, top: 0.0, bottom: 10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Colors.black.withOpacity(.2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(campos.images.first),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: 0, left: 0, bottom: 0),
                              child: Text(
                                campos.field,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5.0, left: 0.0, bottom: 0.0),
                              child: Text(
                                campos.enterprise,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: 5.0, left: 0.0, bottom: 0.0),
                              child: Text(
                                campos.ubication,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(children: _stars(campos.stars)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _stars(int star) {
    List<Widget> widget = List<Widget>();
    for (var i = 1; i < star; i++) {
      widget.add(
        Icon(
          Icons.star,
          color: CustomColors.iconColor,
          size: 13,
        ),
      );
    }
    return widget;
  }
}

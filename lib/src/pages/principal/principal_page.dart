import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/widgets/Search/search_widget.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  static final routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                margin: EdgeInsets.all(20),
                child: Text(
                  "Campos",
                  style: TextStyle(
                      color: CustomColors.primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () => {},
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 0, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                          padding: EdgeInsets.only(left: 0),
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://picsum.photos/200/300/?blur"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0)),
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
                                        bottomLeft: Radius.circular(15.0)),
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 5, left: 0, bottom: 0),
                                          child: Text(
                                            "Image",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Oswald',
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin:
                                              EdgeInsets.only(top: 0, left: 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Imagen corta",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13,
                                                          fontFamily: 'Oswald',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              /* Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.attach_money,
                                        color: Colors.black87, size: 14),
                                        Text(
                                          "${widget.bestDeals.nombre}",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                            fontFamily: 'Oswald',
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ],
                                    ),
                                  ), */
                                            ],
                                          )),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 10, left: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        CustomColors.iconColor,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        CustomColors.iconColor,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        CustomColors.iconColor,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        CustomColors.iconColor,
                                                    size: 13,
                                                  ),
                                                  Icon(
                                                    Icons.star_half,
                                                    color:
                                                        CustomColors.iconColor,
                                                    size: 13,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            /* Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          "/per night",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 12,
                                              fontFamily: 'Oswald',
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ) */
                                          ],
                                        ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

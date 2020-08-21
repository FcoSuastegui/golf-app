import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/pages/campo/informacion/informacion_tab.dart';
import 'package:clubgolf/src/pages/campo/informacion/reglamento_tab.dart';
import 'package:google_fonts/google_fonts.dart';

class InformacionScreen extends StatelessWidget {
  const InformacionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Información",
          style: GoogleFonts.quicksand(
            color: Colors.black
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              child: Material(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 5.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: TabBar(
                    labelStyle: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    tabs: [
                      Tab(
                        text: "Información",
                      ),
                      Tab(
                        text: "Reglamento",
                      ),
                    ],
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.black45,
                    unselectedLabelStyle: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                    labelColor: CustomColors.primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  InformacionTab(),
                  ReglamentoTab(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

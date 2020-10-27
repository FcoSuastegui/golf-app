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
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0.0,
          title: Text(
            "Infomación",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: Get.back,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              TabBar(
                labelStyle: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                tabs: [
                  Tab(
                    text: "General",
                  ),
                  Tab(
                    text: "Reglamento",
                  ),
                ],
                indicatorColor: CustomColors.primaryColor,
                unselectedLabelColor: Colors.black87,
                unselectedLabelStyle: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                ),
                labelColor: CustomColors.primaryColor,
              ),
              SizedBox(
                height: 10.0,
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
          ),
        ),
      ),
    );
  }
}

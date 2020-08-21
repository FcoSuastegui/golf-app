import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Club De Golf",
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: Routes.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        primaryColor: CustomColors.primaryColor,
        backgroundColor: CustomColors.secondColor,
      ),
      locale: Locale('es'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: ( deviceLocale, supporteLocate) => supporteLocate.first,
      supportedLocales: [
        const Locale('es'), // Español
        const Locale('en'), // English
      ],
    );
  }
}
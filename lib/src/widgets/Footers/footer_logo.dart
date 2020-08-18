import 'package:clubgolf/src/helpers/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterLogo extends StatelessWidget {
  final String textPrincipal, textSecondary;
  final Function router;
  FooterLogo({
    Key key,
    @required this.textPrincipal,
    @required this.textSecondary,
    @required this.router
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.quicksand(
                  color: Colors.black54,
                ),
                text: textPrincipal,
                children: <TextSpan>[
                  TextSpan(
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryColor,
                    ),
                    text: " $textSecondary",
                    recognizer: TapGestureRecognizer()..onTap = router,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Powered by",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Image.asset(
                "assets/images/apleeks_01.png",
                width: 90.0,
                height: 90.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

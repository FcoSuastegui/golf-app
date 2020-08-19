import 'package:flutter/material.dart';
import 'package:clubgolf/src/helpers/colors.dart';

class CardCustomWidget extends StatelessWidget {
  final Icon icon;
  final String text;
  final Color iconColor;
  final Function onPress;
  final double left, top, right, buttom, height;

  CardCustomWidget({
    @required this.icon,
    @required this.text,
    @required this.onPress,
    this.iconColor = CustomColors.iconColor,
    this.left = 10,
    this.top = 10.0,
    this.right = 10.0,
    this.buttom = 10.0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
          ),
          child: Container(
            height: height ?? MediaQuery.of(context).size.height * 0.10,
            margin: EdgeInsets.fromLTRB(left, top, right, buttom),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: CustomColors.primaryColor,
                  width: 7.0,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                icon,
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

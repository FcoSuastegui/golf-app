import 'package:clubgolf/src/helpers/colors.dart';
import 'package:flutter/material.dart';

class ButtonSubmitBloc extends StatelessWidget {
  final Function submit;
  final String text;
  final Color color, textColor;

  ButtonSubmitBloc({
    Key key,
    @required this.submit,
    @required this.text,
    this.color = CustomColors.primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        margin: EdgeInsets.only(
          bottom: 10,
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      color: color,
      textColor: textColor,
      onPressed: submit,
    );
  }
}

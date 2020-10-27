import 'package:clubgolf/src/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TextInputFieldBloc extends StatelessWidget {
  final textFieldBloc;
  final String labelText;
  final TextInputType keyboardType;
  final SuffixButton suffixButton;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function onSubmitted;
  final TextStyle labelStyle, style;

  TextInputFieldBloc({
    Key key,
    @required this.textFieldBloc,
    this.labelText,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.inputFormatters,
    this.suffixButton,
    this.labelStyle,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textInputAction: textInputAction,
      textFieldBloc: textFieldBloc,
      onSubmitted: onSubmitted ?? (_) =>  FocusScope.of(context).nextFocus(),
      keyboardType: keyboardType,
      suffixButton: suffixButton,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.borderColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.borderColor,
          ),
        ),
        labelText: labelText,
        labelStyle: labelStyle,
      ),
      style: style,
    );
  }
}

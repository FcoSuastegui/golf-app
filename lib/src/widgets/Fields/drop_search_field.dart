import 'package:clubgolf/src/helpers/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropSearchField extends StatelessWidget {
  final String errorText, label, selectedItem;
  final bool showSelectedItem, showClearButton;
  final List<String> items;
  final ValueChanged<String> onChanged, popupItemDisabled;

  DropSearchField({
    Key key,
    @required this.label,
    @required this.items,
    this.errorText,
    this.showSelectedItem = true,
    this.showClearButton = false,
    this.onChanged,
    this.popupItemDisabled,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: DropdownSearch<String>(
        dropdownSearchDecoration: InputDecoration(
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
          labelStyle: GoogleFonts.lato(
            fontSize: 15.0,
            color: Colors.grey[600],
          ),
          errorText: errorText,
        ),
        mode: Mode.MENU,
        showSelectedItem: showSelectedItem,
        items: items,
        label: label,
        showClearButton: showClearButton,
        onChanged: onChanged,
        popupItemDisabled: popupItemDisabled,
        selectedItem: selectedItem,
        //popupItemDisabled: (String s) => s.startsWith('I'),
      ),
    );
  }
}

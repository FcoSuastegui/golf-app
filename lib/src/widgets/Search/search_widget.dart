import 'package:clubgolf/src/helpers/colors.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  SearchBarWidget({@required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 0.3),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? 'Buscar',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0.5),
            child: Icon(
              Icons.search,
              size: 20.0,
              color: CustomColors.iconColor,
            ),
          ),
        ],
      ),
    );
  }
}

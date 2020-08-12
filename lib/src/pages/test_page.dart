import 'package:flutter/material.dart';


class PruebaPage extends StatefulWidget {
  PruebaPage({Key key}) : super(key: key);

  @override
  _PruebaPageState createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {

  final double barsHeight = 80.0;
  final double barsWidth = 3.0;
  final Color inactiveBarColor = Colors.grey;
  final Color activeBarColor = Colors.blue;

  Map<String, bool> steps = {
    "Complaint Received": true,
    "Engineer Assigned": true,
    "Engineer On the way": false,
    "Complaint Done": false,
  };

  @override
  Widget build(BuildContext context) {
    double _rowPadding  = (barsHeight - kRadialReactionRadius) / 2;
    double _barHeight   = _rowPadding < 0 ? kRadialReactionRadius : barsHeight;
    double rowPadding   = _rowPadding < 0 ? 0 : _rowPadding;
  
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Stack(
          fit: StackFit.loose, 
          children: <Widget>[
          Positioned(
            left: kRadialReactionRadius - barsWidth / 2,
            top: kRadialReactionRadius + rowPadding,
            bottom: kRadialReactionRadius + rowPadding,
            width: barsWidth,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: List.generate(steps.length - 1, (i) =>
              Container(
                margin: EdgeInsets.symmetric(vertical: kRadialReactionRadius / 2 - 2),
                height: _barHeight + 4,
                color: steps.values.elementAt(i) && steps.values.elementAt(i + 1) ? activeBarColor : inactiveBarColor,
              )
            ))
          ),
          Theme(
            data: Theme.of(context).copyWith(disabledColor: inactiveBarColor, unselectedWidgetColor: inactiveBarColor),
            child: Column(mainAxisSize: MainAxisSize.min, children: steps.keys.map((key) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: rowPadding),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  Checkbox(
                    value: steps[key],
                    onChanged: steps[key] ? (_) {} : null,
                    activeColor: activeBarColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text(key),
                ])
              )
            ).toList())
          )

        ]),
      ),
    );
  }
}
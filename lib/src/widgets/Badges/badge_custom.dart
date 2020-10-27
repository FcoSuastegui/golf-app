import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeCustom extends StatelessWidget {
  final Function onTap;
  final BadgeShape shape;
  final BadgePosition position;
  final EdgeInsets padding;
  final double borderRadius;
  final String badgeText;

  BadgeCustom({
    Key key,
    @required this.badgeText,
    this.onTap,
    this.shape = BadgeShape.circle,
    this.position,
    this.padding = const EdgeInsets.all(4.0),
    this.borderRadius = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Badge(
          shape: shape,
          borderRadius: borderRadius,
          position:
              position ?? BadgePosition.topRight(top: -12.0, right: -5.0),
          padding: padding,
          badgeContent: Text(
            'X',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          child: Text(
            badgeText ?? '',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}

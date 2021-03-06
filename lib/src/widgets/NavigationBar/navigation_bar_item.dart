import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_bar_theme.dart';

// ignore: must_be_immutable
class NavigationBarItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Widget iconWidget;
  final Duration animationDuration;
  Color selectedBackgroundColor;
  Color selectedForegroundColor;
  Color selectedLabelColor;

  int index;
  int selectedIndex;
  NavigationBarTheme theme;
  bool showSelectedItemShadow;
  double itemWidth;

  void setIndex(int index) {
    this.index = index;
  }

  Color _getDerivedBorderColor() {
    return theme.selectedItemBorderColor ?? theme.barBackgroundColor;
  }

  Color _getBorderColor(bool isOn) {
    return isOn ? _getDerivedBorderColor() : Colors.transparent;
  }

  bool _isItemSelected() {
    return index == selectedIndex;
  }

  static const kDefaultAnimationDuration = Duration(milliseconds: 1500);

  NavigationBarItem({
    Key key,
    this.label,
    this.itemWidth = 50,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.selectedLabelColor,
    this.iconData,
    this.animationDuration = kDefaultAnimationDuration,
    this.iconWidget,
  }) : super(key: key);

  Center _makeLabel(String label) {
    bool isSelected = _isItemSelected();
    return Center(
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isSelected
              ? theme.selectedItemTextStyle.fontSize
              : theme.unselectedItemTextStyle.fontSize,
          fontWeight: isSelected
              ? theme.selectedItemTextStyle.fontWeight
              : theme.unselectedItemTextStyle.fontWeight,
          color: isSelected
              ? selectedLabelColor ?? theme.selectedItemLabelColor
              : theme.unselectedItemLabelColor,
          letterSpacing: isSelected ? 1.1 : 1.0,
        ),
      ),
    );
  }

  Widget _makeIconArea(double itemWidth, Widget iconWidget ) {
    bool isSelected = _isItemSelected();
    double radius = itemWidth / 2;
    double innerBoxSize = itemWidth - 8;
    double innerRadius = (itemWidth - 8) / 2 - 4;

    return CircleAvatar(
      radius: isSelected ? radius : radius * 0.7,
      backgroundColor: _getBorderColor(isSelected),
      child: SizedBox(
        width: innerBoxSize,
        height: isSelected ? innerBoxSize : innerBoxSize / 2,
        child: CircleAvatar(
          radius: innerRadius,
          backgroundColor: isSelected
              ? selectedBackgroundColor ?? theme.selectedItemBackgroundColor
              : theme.unselectedItemBackgroundColor,
          child: iconWidget,
        ),
      ),
    );
  }

  Widget _makeIcon(IconData iconData) {
    bool isSelected = _isItemSelected();
    return Icon(
      iconData,
      color: isSelected
          ? selectedForegroundColor ?? theme.selectedItemIconColor
          : theme.unselectedItemIconColor,
    );
  }

  Widget _makeShadow() {
    bool isSelected = _isItemSelected();
    double height = isSelected ? 4 : 0;
    double width = isSelected ? itemWidth + 6 : 0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(itemWidth / 2, 2)),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Provider.of<NavigationBarTheme>(context);
    showSelectedItemShadow = theme.showSelectedItemShadow;
    itemWidth = theme.itemWidth;
    selectedIndex = Provider.of<int>(context);

    selectedBackgroundColor =
        selectedBackgroundColor ?? theme.selectedItemBackgroundColor;
    selectedForegroundColor =
        selectedForegroundColor ?? theme.selectedItemIconColor;
    selectedLabelColor = selectedLabelColor ?? theme.selectedItemLabelColor;

    bool isSelected = _isItemSelected();
    double itemHeight = itemWidth - 20;
    double topOffset = isSelected ? -20 : -10;
    double iconTopSpacer = isSelected ? 0 : 2;
    double shadowTopSpacer = 4;

    Widget labelWidget = _makeLabel(label);
    Widget _iconWidget = iconData != null ? _makeIcon(iconData) : iconWidget; 
    Widget iconAreaWidget = _makeIconArea(itemWidth,  _iconWidget);
    Widget shadowWidget = showSelectedItemShadow ? _makeShadow() : Container();

    return AnimatedContainer(
      width: itemWidth,
      height: double.maxFinite,
      duration: animationDuration,
      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: topOffset,
              left: -itemWidth / 2,
              right: -itemWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: iconTopSpacer),
                  iconAreaWidget,
                  labelWidget,
                  SizedBox(height: shadowTopSpacer),
                  shadowWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

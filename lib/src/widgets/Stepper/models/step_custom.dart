import 'package:flutter/widgets.dart';

class StepCustom {
  final Widget title;
  final Widget subtitle;
  final Widget content;
  final String Function() validation;

  StepCustom({
    this.title,
    this.subtitle,
    @required this.content,
    @required this.validation,
  });
}
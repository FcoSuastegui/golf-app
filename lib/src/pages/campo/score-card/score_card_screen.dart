import 'package:clubgolf/src/widgets/Scaffold/scaffold_template_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardScreen extends StatelessWidget {
  const ScoreCardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      body: Center(
        child: Text("Center")
      ),
    );
  }
}
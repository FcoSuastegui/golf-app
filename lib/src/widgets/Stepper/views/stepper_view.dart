import 'package:clubgolf/src/widgets/Stepper/models/step_custom.dart';
import 'package:clubgolf/src/widgets/Stepper/models/stepper_config.dart';
import 'package:flutter/material.dart';

class StepperView extends StatelessWidget {
  final StepCustom step;
  final VoidCallback onStepNext;
  final VoidCallback onStepBack;
  final EdgeInsetsGeometry contentPadding;
  final StepperConfig config;

  const StepperView({
    Key key,
    @required this.step,
    this.onStepNext,
    this.onStepBack,
    this.contentPadding,
    this.config,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: step.title ?? SizedBox.shrink()
              ),
              SizedBox(width: 5.0),
              Visibility(
                visible: config.icon == null,
                child: config.icon ?? Container(),
                replacement: config.icon ?? Container()
              )
            ],
          ),
          SizedBox(height: 5.0),
          step.subtitle ?? SizedBox.shrink(),
        ],
      ),
    );

    final content = Expanded(
      child: SingleChildScrollView(
        padding: contentPadding,
        child: step.content,
      ),
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, content],
      ),
    );
  }
}

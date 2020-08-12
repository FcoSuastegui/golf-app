
export 'package:clubgolf/src/widgets/Stepper/models/step_custom.dart';
export 'package:clubgolf/src/widgets/Stepper/models/stepper_config.dart';

import 'package:clubgolf/src/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:clubgolf/src/widgets/Stepper/models/step_custom.dart';
import 'package:clubgolf/src/widgets/Stepper/models/stepper_config.dart';
import 'package:clubgolf/src/widgets/Stepper/views/stepper_view.dart';


/// StepperCustom
class StepperCustom extends StatefulWidget {
  final List<StepCustom> steps;
  final VoidCallback onCompleted;
  final EdgeInsetsGeometry contentPadding;
  final StepperConfig config;

  const StepperCustom({
    Key key,
    @required this.steps,
    @required this.onCompleted,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20.0),
    this.config = const StepperConfig(
      backText: "REGRESAR",
      nextText: "SIGUIENTE",
      stepText: "PASO",
      ofText: "PASO",
    ),
  }) : super(key: key);

  @override
  _StepperCustomState createState() => _StepperCustomState();
}

class _StepperCustomState extends State<StepperCustom> {
  PageController _controller = PageController();

  int currentStep = 0;

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    super.dispose();
  }

  switchToPage(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  bool _isFirst(int index) => index == 0;

  bool _isLast(int index) => widget.steps.length - 1 == index;

  onStepNext() {
    String validation = widget.steps[currentStep].validation();
    if (validation == null) {
      if (!_isLast(currentStep)) {
        setState(() => currentStep++ );
        FocusScope.of(context).unfocus();
        switchToPage(currentStep);
      } else {
        widget.onCompleted();
      }
    } else {
      // Do Nothing
    }
  }

  onStepBack() {
    if (!_isFirst(currentStep)) {
      setState(() => currentStep-- );
      switchToPage(currentStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: widget.steps.map((step) {
          return StepperView(
            step: step,
            contentPadding: widget.contentPadding,
            config: widget.config,
          );
        }).toList(),
      ),
    );

    final counter = Container(
      child: Text(
        "${widget.config.stepText ?? 'PASO'} ${currentStep + 1} ${widget.config.ofText ?? 'DE'} ${widget.steps.length}",
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final buttons = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: onStepBack,
            child: Text(
              widget.config.backText ?? "REGRESAR",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          counter,
          FlatButton(
            onPressed: onStepNext,
            child: Text(
              widget.config.nextText ?? "SIGUIENTE",
              style: TextStyle(
                color: CustomColors.secondColor,
              ),
            ),
          ),
        ],
      ),
    );

    return Container(
      child: Column(
        children: [content, buttons],
      ),
    );
  }
}

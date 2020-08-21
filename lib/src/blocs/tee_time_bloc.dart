import 'package:clubgolf/src/blocs/validators/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TeeTimeBloc extends FormBloc<String, String> {
  final dateTime = InputFieldBloc<DateTime, Object>();

  TeeTimeBloc() {
    addFieldBlocs(
      fieldBlocs: [
        dateTime,
      ],
    );

    dateTime..addValidators([Validators.requiredDateTime(dateTime), Validators.validDate(dateTime)]);
  }

  @override
  void onSubmitting() {}
}

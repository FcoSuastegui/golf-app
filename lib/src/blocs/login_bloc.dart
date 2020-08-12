

import 'package:clubgolf/src/blocs/validators/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginBloc extends FormBloc<String, String> {
  
  final email     = TextFieldBloc();
  final password  = TextFieldBloc();

  LoginBloc() {
    addFieldBlocs(fieldBlocs: [email,password] );
    email
    ..addValidators([ Validators.requiredField(email), Validators.emailFormat(email) ]);
    password
    ..addValidators([ Validators.requiredField(password)]);
  }

  @override
  void onSubmitting() async {
    emitSuccess( canSubmitAgain: true, successResponse: "Exito");
  }

}
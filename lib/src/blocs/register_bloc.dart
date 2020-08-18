import 'package:clubgolf/src/blocs/validators/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterBloc extends FormBloc<String, String> {
  final nombre = TextFieldBloc();
  final primerAp = TextFieldBloc();
  final segundoAp = TextFieldBloc();
  final correo = TextFieldBloc();
  final numero = TextFieldBloc();

  RegisterBloc() {
    addFieldBlocs(fieldBlocs: [nombre, primerAp, segundoAp, correo, numero]);
    nombre..addValidators([Validators.requiredField(nombre)]);
    primerAp..addValidators([Validators.requiredField(primerAp)]);
    correo
      ..addValidators(
          [Validators.requiredField(correo), Validators.emailFormat(correo)]);
    numero
      ..addValidators(
          [Validators.requiredField(numero), Validators.numeroCelular(numero)]);
  }

  void dispose() {
    nombre?.close();
    primerAp?.close();
    segundoAp?.close();
    correo?.close();
    numero?.close();
  }

  @override
  void onSubmitting() {}
}

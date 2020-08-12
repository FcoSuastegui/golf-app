
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:clubgolf/src/blocs/validators/validators.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class RegisterBloc extends FormBloc<String, String> {

  final _radioButton = BehaviorSubject <bool>();
  bool isSocio = true;
  
  Stream    get radioButtonStream   => _radioButton.stream;
  Function  get radioButtonSink    => _radioButton.sink.add;
  
  void changeValue(bool val) {
    isSocio = val;
    radioButtonSink(val);
  }

  void dispose() {
    _radioButton?.close();
  }
  
  final numeroMebresia  = TextFieldBloc();
  final step1           = TextFieldBloc();
  final nombres         = TextFieldBloc();
  final apellidos       = TextFieldBloc();
  final primerApellido  = TextFieldBloc();
  final segundoApellido = TextFieldBloc();
  final correo          = TextFieldBloc();
  final celular         = TextFieldBloc();

  RegisterBloc(){
    addFieldBlocs(
      step: 0,
      fieldBlocs: [
        numeroMebresia,
        nombres,
        apellidos
      ],
    );

    addFieldBlocs(
      step: 1, 
      fieldBlocs: [
        step1,
      ]
    );

    addFieldBlocs(
      step: 2, 
      fieldBlocs: [
        step1,
      ]
    );

    numeroMebresia
    ..addValidators([ Validators.requiredField(numeroMebresia), ]);
    nombres
    ..addValidators([ Validators.requiredField(nombres)]);
    apellidos
    ..addValidators([ Validators.requiredField(apellidos)]);
    primerApellido
    ..addValidators([ Validators.requiredField(primerApellido)]);
    segundoApellido
    ..addValidators([ Validators.requiredField(segundoApellido)]);
    correo
    ..addValidators([ Validators.requiredField(correo)]);
    celular
    ..addValidators([ Validators.requiredField(celular)]);
    
    
    radioButtonStream.listen((data) {
      removeFieldBlocs(
        fieldBlocs: [
          numeroMebresia,
          nombres,
          apellidos,
          primerApellido,
          segundoApellido,
          correo,
          celular,
        ],
      );

      data ? 
        addFieldBlocs(fieldBlocs: [
            numeroMebresia,
            nombres,
            apellidos,
          ])
      : addFieldBlocs(fieldBlocs: [
        nombres,
        primerApellido,
        segundoApellido,
        correo,
        celular,
      ]);


      print(data);
    });

  }

  @override
  Future<void> close() {
    numeroMebresia.close();
    nombres.close();
    primerApellido.close();
    segundoApellido.close();
    correo.close();
    celular.close();
    step1.close();

    return super.close();
  }

  @override
  void onSubmitting() async {

    if( state.currentStep == 0 ) {
      await Future<void>.delayed(Duration(milliseconds: 500));
      emitSuccess();
    } else if( state.currentStep == 1 ) {
      await Future<void>.delayed(Duration(milliseconds: 500));
      emitSuccess();
    } else {
      await Future<void>.delayed(Duration(milliseconds: 500));
      emitSuccess(canSubmitAgain: true);
    }

  }

}
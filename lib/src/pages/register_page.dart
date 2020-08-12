import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:clubgolf/src/widgets/Loading/loading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:clubgolf/src/blocs/register_bloc.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  static final routeName = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Get.back()),
        backgroundColor: CustomColors.backColor,
      ),
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: Builder(
          builder: (context) {
            final registerBloc = BlocProvider.of<RegisterBloc>(context);
            return FormBlocListener<RegisterBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) async {
                LoadingDialog.hide(context);
                  //registerBloc.close();
              },
              onFailure: (context, state) async {
                LoadingDialog.hide(context);
              },
              child: StepperFormBlocBuilder<RegisterBloc>(
                type: StepperType.horizontal,
                controlsBuilder: (BuildContext context, VoidCallback onStepContinue, VoidCallback onStepCancel, int step, FormBloc formBloc) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: onStepCancel,
                          child: const Text('REGRESAR'),
                        ),
                        FlatButton(
                          onPressed: onStepContinue,
                          child: const Text('CONTINUAR'),
                        ),
                      ],
                    ),
                  );
                },
                physics: ScrollPhysics(),
                stepsBuilder: (formBloc) {
                   return [
                     _accountStep(registerBloc),
                     _confimation(registerBloc),
                     _finish(registerBloc),
                   ];
                } 
              )
            );
          }
        )
      )
    );
  }

  FormBlocStep _accountStep(RegisterBloc registerBloc) {
    return FormBlocStep(
      title: Text('Datos generales', style: TextStyle(fontSize: 10.0),),
      state: registerBloc.state.isFirstStep ? StepState.editing : StepState.complete,
      content: Column(
        children: <Widget>[
          StreamBuilder(
            stream: registerBloc.radioButtonStream,
            initialData: true,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              return Row(
                children: <Widget>[
                  Radio(
                    value: true,
                    groupValue: snapshot.data,
                    activeColor: CustomColors.primaryColor,
                    onChanged: (val) => registerBloc.changeValue(val)
                  ),
                  Text("Soy un socio"),
                  Radio(
                    value: false,
                    groupValue: snapshot.data,
                    activeColor: CustomColors.primaryColor,
                    onChanged: (val) =>  registerBloc.changeValue(val)
                  ),
                  Text("Soy un visitante"),
                ],
              );
            },
          ),          
          StreamBuilder(
            stream: registerBloc.radioButtonStream,
            initialData: true,
            builder: (BuildContext context, AsyncSnapshot snapshot) => 
                _textFields(snapshot.data, registerBloc)
          )
        ]
      )
    );
  }

  FormBlocStep _confimation(RegisterBloc registerBloc) {
    return FormBlocStep(
      title: Text('Confirmación',style: TextStyle(fontSize: 10.0),),
      state: registerBloc.state.isLastStep ? StepState.editing : StepState.complete,
      content: Column(
        children: <Widget>[
          Icon(Icons.error, size: 60.0, color: CustomColors.primaryColor,),
          SizedBox(height: 10.0,),
          Text("CONFIRMACIÓN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          SizedBox(height: 10.0,),
          Text(
            "Gracias por ingresar tus datos,",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "validaremos tu número de",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "mebresía y te enviaremos tus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "accesos por SMS al número que nos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "proporcionaste.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.0,),

          _columns(registerBloc)

        ]
      )
    );
  }


  FormBlocStep _finish(RegisterBloc registerBloc) {
    return FormBlocStep(
      title: Text('Terminar',style: TextStyle(fontSize: 10.0),),
      state: registerBloc.state.isLastStep ? StepState.editing : StepState.complete,
      content: Column(
        children: <Widget>[
          Icon(Icons.error, size: 60.0, color: CustomColors.primaryColor,),
          SizedBox(height: 10.0,),
          Text("CONFIRMACIÓN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
          SizedBox(height: 10.0,),
          Text(
            "Gracias por ingresar tus datos,",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "validaremos tu número de",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "mebresía y te enviaremos tus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "accesos por SMS al número que nos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "proporcionaste.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black54
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.0,),

          _columns(registerBloc)

        ]
      )
    );
  }



  Widget _textFields( bool data, RegisterBloc registerBloc) {
    print(data);
    return Column(
      children: <Widget>[
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.numeroMebresia,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Número de membresía',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
                
              ),
            ),
          ),
          visible: data ? true : false
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.nombres,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nombre(s)',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
            ),
          ),
          visible: true
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.apellidos,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                labelText: 'Apellidos',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
            ),
          ),
          visible: data ? true : false
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.primerApellido,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Primer apellido',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
            ),
          ),
          visible: !data ? true : false
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.segundoApellido,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Segundo apellido',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
            ),
          ),
          visible: !data ? true : false
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.correo,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
            ),
          ),
          visible: !data ? true : false
        ),
        Visibility(
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: CustomColors.borderColor))
            ),
            child: TextFieldBlocBuilder(
              textFieldBloc: registerBloc.celular,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                labelText: 'Número de celular',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
            ),
          ),
          visible: !data ? true : false
        )
          
      ],
    );
  }

  Widget _columns( RegisterBloc registerBloc ) {
    print("Data : ${registerBloc.isSocio}");
    return registerBloc.isSocio ? 
        Column(
          children: <Widget>[
              Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Membresía: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black54
                  ),
                ),
                Text("${registerBloc.numeroMebresia.value.toUpperCase() }",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black54
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Nombre(s): ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                  Text("${registerBloc.nombres.value.toUpperCase()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Apellidos: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                  Text("${registerBloc.apellidos.value.toUpperCase()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
          ],
      ) 
      : 
      Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Nombre(s): ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black54
                  ),
                ),
                Text("${registerBloc.nombres.value.toUpperCase()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black54
                  ),
                ),
              ],
            ),
          ),
           Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Apellidos: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                  Text("${registerBloc.primerApellido.value.toUpperCase()} ${registerBloc.segundoApellido.value.toUpperCase()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Correo: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                  Text("${registerBloc.correo.value.toUpperCase()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Número: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                  Text("${registerBloc.celular.value.toUpperCase()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
  }


}
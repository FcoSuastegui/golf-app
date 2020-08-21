import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubgolf/src/blocs/register_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:clubgolf/src/widgets/TextInput/text_input_field_bloc.dart';
import 'package:clubgolf/src/helpers/formatters.dart';
import 'package:clubgolf/src/widgets/Buttons/button_submit.dart';
import 'package:clubgolf/src/widgets/Footers/footer_logo.dart';
import 'package:clubgolf/src/widgets/Loading/loading.dart';

class RegisterPage extends StatelessWidget {
  static final routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 0.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/banner-login.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.teal[800],
                          Colors.teal[200],
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      top: 210.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: BlocProvider(
                        create: (context) => RegisterBloc(),
                        child: Builder(
                          builder: (context) {
                            final register = context.bloc<RegisterBloc>();
                            return FormBlocListener<RegisterBloc, String,
                                String>(
                              onSubmitting: (context, state) => LoadingDialog.show(context),
                              onSuccess: (context, state) {
                                LoadingDialog.hide(context);
                              },
                              onFailure: (context, state) {
                                LoadingDialog.hide(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "CREA UNA NUEVA CUENTA",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextInputFieldBloc(
                                    textFieldBloc: register.nombre,
                                    labelText: "Nombre(s)",
                                    onSubmitted: (_) =>
                                        FocusScope.of(context).nextFocus(),
                                  ),
                                  TextInputFieldBloc(
                                    textFieldBloc: register.primerAp,
                                    labelText: "Primer apellido",
                                    onSubmitted: (_) =>
                                        FocusScope.of(context).nextFocus(),
                                  ),
                                  TextInputFieldBloc(
                                    textFieldBloc: register.segundoAp,
                                    labelText: "Segundo apellido",
                                    onSubmitted: (_) =>
                                        FocusScope.of(context).nextFocus(),
                                  ),
                                  TextInputFieldBloc(
                                    textFieldBloc: register.correo,
                                    labelText: "Correo electrónico",
                                    onSubmitted: (_) =>
                                        FocusScope.of(context).nextFocus(),
                                  ),
                                  TextInputFieldBloc(
                                    textFieldBloc: register.numero,
                                    labelText: "Número de celular",
                                    onSubmitted: (_) =>
                                        FocusScope.of(context).unfocus(),
                                    inputFormatters: [
                                      MaskedTextInputFormatter(
                                        mask: 'xxx xxxx xxx',
                                        separator: ' ',
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 10.0,
                                      left: 5.0,
                                      right: 5.0,
                                    ),
                                    child: Text(
                                      "* Se te enviará un SMS con tu contraseña para acceder a la aplicación.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  ButtonSubmit(
                                    submit: register.submit,
                                    text: "ACEPTAR",
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  FooterLogo(
                                    textPrincipal: 'Ya tengo una cuenta',
                                    textSecondary: '¡Iniciar sesión!',
                                    router: () => Get.back(),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    top: 40.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

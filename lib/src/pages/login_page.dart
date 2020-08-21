import 'package:clubgolf/src/widgets/Buttons/button_submit.dart';
import 'package:clubgolf/src/widgets/Footers/footer_logo.dart';
import 'package:clubgolf/src/widgets/TextInput/text_input_field_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clubgolf/src/blocs/login_bloc.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/pages/register_page.dart';
import 'package:clubgolf/src/widgets/Animation/fade_animation.dart';
import 'package:clubgolf/src/widgets/Loading/loading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart' as getx;

class LoginPage extends StatelessWidget {
  static final routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.32,
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
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/images/logo-app.png",
                        ),
                      ),
                    )
                  ],
                ),
                BlocProvider(
                  create: (context) => LoginBloc(),
                  child: Builder(
                    builder: (context) {
                      final login = context.bloc<LoginBloc>();
                      return FormBlocListener<LoginBloc, String, String>(
                        onSubmitting: (context, state) =>
                            LoadingDialog.show(context),
                        onSuccess: (context, state) async {
                          LoadingDialog.hide(context);
                          getx.Get.offAllNamed('/home');
                          login.close();
                        },
                        onFailure: (context, state) async {
                          LoadingDialog.hide(context);
                          getx.Get.snackbar(
                            "Error",
                            state.failureResponse,
                            colorText: Colors.white,
                            backgroundColor: Colors.red.withOpacity(0.8),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(1, textLogin),
                              FadeAnimation(
                                1.4,
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 50,
                                        offset: Offset(0, 10),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      TextInputFieldBloc(
                                        textFieldBloc: login.email,
                                        labelText: "Correo electrónico",
                                        onSubmitted: (_) =>
                                            FocusScope.of(context).nextFocus(),
                                      ),
                                      TextInputFieldBloc(
                                        textFieldBloc: login.password,
                                        labelText: "Contraseña",
                                        suffixButton: SuffixButton.obscureText,
                                        textInputAction: TextInputAction.done,
                                        onSubmitted: (_) =>
                                            FocusScope.of(context).unfocus(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              FadeAnimation(
                                1.5,
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Olvidé mi contraseña",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              FadeAnimation(
                                1.6,
                                ButtonSubmit(
                                  submit: login.submit,
                                  text: "ENTRAR",
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              FooterLogo(
                                textPrincipal: '¿Aún no tienes cuenta?',
                                textSecondary: '¡Registrate!',
                                router: () => getx.Get.to(
                                  RegisterPage(),
                                  opaque: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final textLogin = Column(
    children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "Ingresa las claves que recibiste.",
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
        ),
      ),
    ],
  );
}

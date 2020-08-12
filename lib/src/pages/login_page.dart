import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:clubgolf/src/blocs/login_bloc.dart';
import 'package:clubgolf/src/helpers/colors.dart';
import 'package:clubgolf/src/pages/register_page.dart';
import 'package:clubgolf/src/widgets/Alerts/custom_alert.dart';
import 'package:clubgolf/src/widgets/Animation/fade_animation.dart';
import 'package:clubgolf/src/widgets/Loading/loading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  static final routeName = '/';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
                          Colors.teal[200]
                        ]
                      )
                    )
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/logo-app.png")
                    )
                  )
                ],
              ),

              BlocProvider(
                create: (context) => LoginBloc(),
                child: Builder( builder: (context) {
                  final login = context.bloc<LoginBloc>();
                  return FormBlocListener<LoginBloc, String, String> (
                    onSubmitting: (context, state) => LoadingDialog.show(context),
                    onSuccess: (context, state) async {
                      LoadingDialog.hide(context);
                      Get.offAndToNamed('/home');
                      /* //login.close();
                      await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return CustomAlert(
                            type:  AlertDialogType.SUCCESS,
                            text: state.successResponse,
                          );
                        },
                      ); */
                    },
                    onFailure: (context, state) async {
                      LoadingDialog.hide(context);
                      await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return CustomAlert(
                            type:  AlertDialogType.ERROR,
                            text: state.failureResponse,
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(1, textLogin ),
                          FadeAnimation(1.4, 
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent,
                                    blurRadius: 50,
                                    offset: Offset(0, 10)
                                  )
                                ]
                              ),
                              child: Column(
                                children: <Widget>[
                                  _email( login ),
                                  SizedBox(height: 40,),
                                  _password( login )
                                ],
                              ),
                            )
                          ),
                          SizedBox(height: 40,),
                          FadeAnimation(1.5, 
                            Align(
                              alignment: Alignment.bottomRight, 
                              child: Text("Olvidé mi contraseña", style: TextStyle( decoration: TextDecoration.underline,),)
                            )
                          ),
                          SizedBox(height: 40,),
                          FadeAnimation(1.6, _submitButton( login )),
                          SizedBox(height: 40,),
                          footer(),
                        ],
                      ),
                    ) ,
                  );
                })
              )
            ]
          )
        )
      )
    );
  }

  Widget footer() => Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('¿Aún no tienes cuenta?, ', style: TextStyle(color: Colors.black54),),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Text('¡Registrate!', style: TextStyle(fontWeight: FontWeight.bold, color: CustomColors.primaryColor)),
              onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => RegisterPage()))
            )
          ],
        ),
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Powered by", style: TextStyle(color: Colors.grey)),
            Image.asset(
              "assets/images/apleeks_01.png",
              width: 90.0,
              height: 90.0,
            )
          ],
        ),
      ],
    ),
  );

  final textLogin  = Column(
    children: <Widget>[
     Align(
      alignment: Alignment.topLeft,
      child: Text("LOGIN", style: TextStyle(color: CustomColors.primaryColor, fontSize: 22.0, fontWeight: FontWeight.bold),),
     ),
     Container(
       margin: EdgeInsets.only(bottom: 20.0),
       child: Align(
        alignment: Alignment.bottomRight,
        child: Text("Ingresa las claves que recibiste.", style: TextStyle(color: Colors.black45)),
       ),
     ),
    ]
  );


  Widget _email( LoginBloc login ) => Container(
    padding: EdgeInsets.all(0),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: CustomColors.borderColor))
    ),
    child: TextFieldBlocBuilder(
      textFieldBloc: login.email,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Correo electrónico",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none
      ),
    ),
  );


  Widget _password( LoginBloc login ) => Container(
    padding: EdgeInsets.all(0),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: CustomColors.borderColor))
    ),
    child: TextFieldBlocBuilder(
      textFieldBloc: login.password,
      suffixButton: SuffixButton.obscureText,
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Contraseña",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    ),
  );

  Widget _submitButton( LoginBloc login ) => RaisedButton(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.symmetric( vertical: 10.0),
      margin: EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
      child: Center(child: Text('ENTRAR'))
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 0.0,
    color: CustomColors.primaryColor,
    textColor: Colors.white,
    onPressed: () => login.submit(),
  );
}
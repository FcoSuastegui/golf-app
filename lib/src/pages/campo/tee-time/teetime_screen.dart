import 'package:clubgolf/src/blocs/tee_time_bloc.dart';
import 'package:clubgolf/src/widgets/Buttons/button_submit.dart';
import 'package:clubgolf/src/widgets/Fields/time_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class TeeTimeScreen extends StatelessWidget {
  TeeTimeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Tee Time",
          style: GoogleFonts.quicksand(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: BlocProvider(
            create: (context) => TeeTimeBloc(),
            child: Builder(
              builder: (context) {
                final teetime = context.bloc<TeeTimeBloc>();
                return FormBlocListener<TeeTimeBloc, String, String>(
                  onSubmitting: (context, state) => {},
                  onSuccess: (context, state) => {},
                  onFailure: (context, state) => {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TimeFieldInput(
                        labelText: "Fecha de salida",
                        dateTimeFieldBloc: teetime.dateTime,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonSubmit(
                        submit: teetime.submit,
                        text: "Continuar",
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

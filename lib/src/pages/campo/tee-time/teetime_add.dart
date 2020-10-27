import 'package:clubgolf/src/pages/campo/tee-time/teetime_add_controller.dart';
import 'package:clubgolf/src/widgets/Scaffold/scaffold_template_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:clubgolf/src/blocs/tee_time_bloc.dart';
import 'package:clubgolf/src/widgets/Buttons/button_submit.dart';
import 'package:clubgolf/src/widgets/Fields/drop_search_field.dart';
import 'package:clubgolf/src/widgets/Fields/time_field_input.dart';

class TeeTimeAdd extends StatelessWidget {
  TeeTimeAdd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      resizeToAvoidBottomInset: true,
      title: "Tee Time",
      leading: Icons.arrow_back,
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
                      GetBuilder<TeeTimeAddController>(
                        init: TeeTimeAddController(),
                        builder: (_) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Obx(
                                () => DropSearchField(
                                  label: "Elija un horario disponible",
                                  items: _.horarios,
                                  selectedItem: _.horarios.first
                                ),
                              ),
                              Obx(
                                () => DropSearchField(
                                  label: "Juego de número de hoyos",
                                  items: _.hoyos,
                                  selectedItem: _.hoyos.first
                                ),
                              ),
                              Obx(
                                () => DropSearchField(
                                  label: "Número de jugadores",
                                  items: _.juagadores,
                                  selectedItem: _.juagadores.first,
                                  onChanged: (String v) =>
                                      _.seleccionarJugador(v),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Obx(
                                () => Wrap(
                                  spacing: 2.0,
                                  children: List.generate(
                                    _.jugadoreSeleccionado.length,
                                    (index) => _.jugadoreSeleccionado.length > 0
                                        ? Chip(
                                            onDeleted: () =>
                                                _.eliminarJugador(index),
                                            deleteIconColor: Colors.black26,
                                            label: Text(
                                              _.jugadoreSeleccionado[index],
                                              style: TextStyle(fontSize: 13.0),
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          left: 5.0,
                          right: 5.0,
                        ),
                        child: Text(
                          '* Si inivtas a otros jugadores, cuando realices tu pago, se enviara una notificación a cada uno. Si los invitados no tienen la app, se generará un código de invitación que puedes compartir con tus contactos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

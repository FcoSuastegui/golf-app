import 'dart:convert';

CamposModel camposModelFromJson(String str) =>
    CamposModel.fromJson(json.decode(str));

String camposModelToJson(CamposModel data) => json.encode(data.toJson());

class CamposModel {
  CamposModel({
    this.id,
    this.nombre,
    this.empresa,
    this.ubicacion,
    this.imagen,
    this.estrellas,
  });

  int id;
  String nombre;
  String empresa;
  String ubicacion;
  String imagen;
  int estrellas;

  factory CamposModel.fromJson(Map<String, dynamic> json) => CamposModel(
    id        : json["id"],
    nombre    : json["nombre"],
    empresa   : json["empresa"],
    ubicacion : json["ubicacion"],
    imagen    : json["imagen"],
    estrellas : json["estrellas"],
  );

  Map<String, dynamic> toJson() => {
      "id"        : id,
      "nombre"    : nombre,
      "empresa"   : empresa,
      "ubicacion" : ubicacion,
      "imagen"    : imagen,
      "estrellas" : estrellas,
  };
}

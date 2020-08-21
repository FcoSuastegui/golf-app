import 'dart:convert';

CamposModel camposModelFromJson(String str) => CamposModel.fromJson(json.decode(str));
String camposModelToJson(CamposModel data) => json.encode(data.toJson());

class CamposModel {
  CamposModel({
    this.images,
    this.field,
    this.enterprise,
    this.ubication,
    this.stars,
    this.description,
    this.regulation,
  });

  List<String> images;
  String field;
  String enterprise;
  String ubication;
  int stars;
  String description;
  String regulation;

  factory CamposModel.fromJson(Map<String, dynamic> json) => CamposModel(
    images        : List<String>.from(json["images"].map((x) => x)),
    field         : json["field"],
    enterprise    : json["enterprise"],
    ubication     : json["ubication"],
    stars         : json["stars"],
    description   : json["description"],
    regulation    : json["regulation"],
  );

  Map<String, dynamic> toJson() => {
    "images"        : List<dynamic>.from(images.map((x) => x)),
    "field"         : field,
    "enterprise"    : enterprise,
    "ubication"     : ubication,
    "stars"         : stars,
    "description"   : description,
    "regulation"    : regulation,
  };
}

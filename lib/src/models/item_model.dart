import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    this.title,
    this.subtitle,
    this.icon,
    this.page,
  });

  String title;
  String subtitle;
  String icon;
  String page;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    title     : json["title"],
    subtitle  : json["subtitle"],
    icon      : json["icon"],
    page      : json["page"],
  );

  Map<String, dynamic> toJson() => {
        "title"     : title,
        "subtitle"  : subtitle,
        "icon"      : icon,
        "page"      : page,
  };
}

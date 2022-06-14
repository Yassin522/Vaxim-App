import 'package:vaxim/module/model/product_model.dart';

class CatModel {
  CatModel({
    this.id,
    this.name,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.locale,
    this.products,
    this.localizations,});

  CatModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    locale = json['locale'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductModel.fromJson(v));
      });
    }
    // if (json['localizations'] != null) {
    //   localizations = [];
    //   json['localizations'].forEach((v) {
    //     localizations?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  int? id;
  String? name;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? locale;
  List<ProductModel>? products;
  List<dynamic>? localizations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['locale'] = locale;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    if (localizations != null) {
      map['localizations'] = localizations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

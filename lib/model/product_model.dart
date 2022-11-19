import 'package:act_4_community_by_ocp/core/service/home_services.dart';
import 'package:act_4_community_by_ocp/helper/extenstion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  late String name, image, description,  price, idcooperative, idcategory;
  ProductModel(
      {required this.name,
        required this.image,
        required this.description,
        required this.price,
        required this.idcooperative,
        required this.idcategory});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }else
    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    idcooperative = map['idcooperative'];
    idcategory = map['idcategory'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'idcooperative': idcooperative,
      'idcategory': idcategory,
    };
  }
}

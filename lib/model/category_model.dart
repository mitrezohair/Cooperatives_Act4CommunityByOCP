import 'package:act_4_community_by_ocp/helper/extenstion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CategoryModel{
  late String name ,  image ;

  CategoryModel({required this.name,required this.image,});

  CategoryModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    name = documentSnapshot["name"];
    image = documentSnapshot["image"];
  }

  CategoryModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return;
    }else{
      image=map['image'];
      name=map['name'];
    }
  }

  toJson(){
      return {
        'name':name,
        'image' : image,
    };
  }
}
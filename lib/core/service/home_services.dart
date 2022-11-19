import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constance.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _productCollectionRef =
  FirebaseFirestore.instance.collection('Products');

  final CollectionReference _cooperativeCollectionRef =
  FirebaseFirestore.instance.collection('Cooperative');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCooperative() async {
    var value = await _cooperativeCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getSearchedP(String val) async {
    var value = await _productCollectionRef.where("name" , whereIn: [val] ).get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProductsByCategory(String cat) async {
    var value = await _productCollectionRef.where("idcategory" , isEqualTo: cat ).get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProductsByCooperative(String cat) async {
    var value = await _productCollectionRef.where("idcooperative" , isEqualTo: cat ).get();

    return value.docs;
  }

  Future<void> addProduct(String  name,String image,String description,String  price,String idcooperative,String idcategory) async {
    await _productCollectionRef
        .add({
      'name' :name,
      'image' :image,
      'description' :description,
      'price' :price,
      'idcooperative' :idcooperative,
      'idcategory' :idcategory,
    });
  }

  Future<void> addCategory(String  name,String image) async {
    await _categoryCollectionRef
        .doc(name) // <-- Document ID
        .set({
      'name' :name,
      'image' :image,
    });
  }

  Future<void> addCooperative(String adresse , String description, String email,String image,String name,String telephone,String urlfacebook ) async {
    await _cooperativeCollectionRef
        .doc(name)
        .set({
      'adresse': adresse,
      'description':description ,
      'email': email,
      'image': image,
      'name': name,
      'telephone': telephone,
      'urlfacebook': urlfacebook,
    });
  }

  Future<void> deleteProduct(String documentId) async{
    await _productCollectionRef
        .doc(documentId)
        .delete();
    Get.snackbar(
        'c\'est fait',
        'Suppression réussie',
        colorText: secondColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:4),
        icon: Icon(FontAwesomeIcons.circleCheck)
    );
  }

  Future<void> deleteCategory(String documentId) async{
    await _categoryCollectionRef
        .doc(documentId)
        .delete();
    Get.snackbar(
        'c\'est fait',
        'Suppression réussie',
        colorText: secondColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:4),
        icon: Icon(FontAwesomeIcons.circleCheck)
    );
  }

  Future<void> deleteCooperative(String documentId) async{
    await _cooperativeCollectionRef
        .doc(documentId)
        .delete();
    Get.snackbar(
        'c\'est fait',
        'Suppression réussie',
        colorText: secondColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:4),
        icon: Icon(FontAwesomeIcons.circleCheck)
    );
  }

  Future<void> UpdateProduct(String price, String DocId ) async {
    await _productCollectionRef
        .doc(DocId)
        .update({
      'price':price,
    });
    Get.snackbar(
        'Confirmation',
        'Produit mise à jour avec succès',
        colorText: secondColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:3),
        icon: Icon(FontAwesomeIcons.circleCheck)
    );
  }



}

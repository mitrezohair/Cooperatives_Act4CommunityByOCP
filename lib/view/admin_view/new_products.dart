import 'dart:io';

import 'package:act_4_community_by_ocp/core/view_model/home_view_model.dart';
import 'package:act_4_community_by_ocp/first_page.dart';
import 'package:act_4_community_by_ocp/view/admin_view/managing_products.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class NewProducts extends GetWidget<HomeViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<HomeViewModel>(
        //init: Get.find(),
        builder: (controller) => controller.loading.value
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          height: 50 ,
          width: 120,
          margin: EdgeInsets.fromLTRB(110, 30, 85, 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Logo1_OCP.png"),
                fit:BoxFit.fill,
                alignment: Alignment.center
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(ManagingProducts());
            },
            child:
            Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )
        ),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.only(
            top: 0,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(FontAwesomeIcons.productHunt,color: primaryColor,size: 80,),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Ajouter un nouveau produit",
                      fontSize: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  alignment: Alignment.center,
                  text: '- veuillez remplir les champs ci-dessous -',
                  fontSize: 16,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 30,
                ),
                //----------------------------------------------   nom de produit
                CustomText(
                  text: "Nom de Produit",
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.name = value.toString();
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },

                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.production_quantity_limits,
                      color: Colors.black,
                      size: 20,
                    ),
                    hintText: " le 1er caractere doit etre MAJUSCULES",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //----------------------------------------------   description du produit
                CustomText(
                  text: "Description",
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.description = value.toString();
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.wysiwyg_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                    hintText: " Description du produit ...",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //----------------------------------------------   Prix de produit
                CustomText(
                  text: "Prix",
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.price = value.toString();
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.circleDollarToSlot,
                      color: Colors.black,
                      size: 20,
                    ),
                    hintText: " ... MAD",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //----------------------------------------------   Category
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Categories').snapshots(), builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CupertinoActivityIndicator(),
                );

              return Container(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(12.0, 10.0, 10.0, 10.0),
                          child: Text(
                            "Categorie",
                          ),
                        )),
                    new Expanded(
                      flex: 4,
                      child: DropdownButton(
                        //value: shopId,
                        isDense: true,
                        onChanged: (valueSelectedByUser) {
                          controller.setSelectedCategory(valueSelectedByUser.toString());
                        },
                        hint: Text(controller.idcategory),
                        items: snapshot.data?.docs
                            .map((DocumentSnapshot document) {
                          return DropdownMenuItem<String>(
                            value: document.get('name'),
                            child: Text(document.get('name')),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            }),
                //------------------------------------------------- Coopérative
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('Cooperative').snapshots(), builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );

                  return Container(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12.0, 10.0, 10.0, 10.0),
                              child: Text(
                                "Coopérative",
                              ),
                            )),
                        new Expanded(
                          flex: 4,
                          child: DropdownButton(
                            //value: shopId,
                            isDense: true,
                            onChanged: (valueSelectedByUser) {
                              controller.setSelectedCooperative(valueSelectedByUser.toString());
                            },
                            hint: Text(controller.idcooperative),
                            items: snapshot.data?.docs
                                .map((DocumentSnapshot document) {
                              return DropdownMenuItem<String>(
                                value: document.get('name'),
                                child: Text(document.get('name')),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                //----------------------------------------------  importer une Image
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Importer une Image",
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    ElevatedButton.icon(
                        onPressed:() {
                          controller.selectFile();
                        },
                        icon: Icon(Icons.ads_click),
                        label: Text("Sélectionner une image")
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed:() {
                          controller.uploadFile();
                        },
                        icon: Icon(Icons.save),
                        label: Text("Charger l'image")
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 130,
                    width: 300,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                      child: Image.file(
                        File(controller.pickedFile?.path?? 'assets/images/Background_Act4C3.jpg',),
                        fit: BoxFit.contain,
                      ),
                ),

                //----------------------------------------------
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      controller.addNewProducts();
                      Get.snackbar(
                        'Confirmation',
                        'Produit ajouté avec succès',
                        colorText: secondColor,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds:3),
                        icon: Icon(FontAwesomeIcons.circleCheck)
                      );
                    }
                  },
                  color: primaryColor,
                  child: CustomText(
                    alignment: Alignment.center,
                    text: "Ajouter un nouveau produit",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ),
    );
  }
}

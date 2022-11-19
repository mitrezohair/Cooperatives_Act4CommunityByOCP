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

class UpdateProducts extends GetWidget<HomeViewModel> {
  late String name,price,documentId;


  UpdateProducts(this.name, this.price, this.documentId);

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
                    Icon(FontAwesomeIcons.productHunt,color: secondColor,size: 80,),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "mettre à jour un produit",
                          fontSize: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      alignment: Alignment.center,
                      text: '- Merci de remplir les champs à modifier -',
                      fontSize: 16,
                      color: primaryColor,
                    ),

                    SizedBox(
                      height: 30,
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
                          controller.UpdateProducts();
                        }
                      },
                      color: primaryColor,
                      child: CustomText(
                        alignment: Alignment.center,
                        text: "mettre à jour votre produit",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      alignment: Alignment.center,
                      text: '- '+name+' -',
                      fontSize: 16,
                      color: primaryColor,
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

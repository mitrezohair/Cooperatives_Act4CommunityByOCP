import 'dart:io';

import 'package:act_4_community_by_ocp/core/view_model/home_view_model.dart';
import 'package:act_4_community_by_ocp/first_page.dart';
import 'package:act_4_community_by_ocp/view/admin_view/managing_category.dart';
import 'package:act_4_community_by_ocp/view/admin_view/managing_products.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class NewCategory extends GetWidget<HomeViewModel> {
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
                  Get.off(ManagingCategory());
                },
                child:
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )
            ),
            actions: [
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.white,
                  textTheme: TextTheme().apply(bodyColor: Colors.white),
                ),
                child: PopupMenuButton<int>(
                  icon: Icon(Icons.menu,color: Colors.black,),
                  color: secondColor,
                  onSelected: (item) => controller.onSelected(context, item),
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.productHunt,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text("Gerer les Produits"),
                        ],
                      ),
                      value: 0,
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem<int>(
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.handHoldingHand,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text("Gerer les Coopératives"),
                        ],
                      ),
                      value: 1,
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem<int>(
                      child: Row(
                        children: [
                          Icon(Icons.account_tree_rounded,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text("Gerer les Categories"),
                        ],
                      ),
                      value: 2,
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem<int>(
                      child: Row(
                        children: [
                          Icon(Icons.admin_panel_settings,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text("Gerer les Administrateurs"),
                        ],
                      ),
                      value: 3,
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem<int>(
                      child: Row(
                        children: [
                          Icon(Icons.output,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text("Se Déconnecter"),
                        ],
                      ),
                      value: 4,
                    )
                  ],
                ),
              ),
            ],
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
                    Icon(Icons.account_tree_rounded,color: primaryColor,size: 80,),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Ajouter une nouvelle catégorie",
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
                    //----------------------------------------------   nom de categorie
                    CustomText(
                      text: "Nom de catégorie",
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
                          Icons.category,
                          color: Colors.black,
                          size: 20,
                        ),
                        hintText: " Entrer une catégorie ...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                        ),
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                          controller.addNewCategory();
                          Get.snackbar(
                              'Confirmation',
                              'Catégorie ajouté avec succès',
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
                        text: "Ajouter un nouveau Catégories",
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

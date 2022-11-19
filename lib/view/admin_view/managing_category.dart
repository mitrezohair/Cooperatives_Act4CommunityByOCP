import 'package:act_4_community_by_ocp/constance.dart';
import 'package:act_4_community_by_ocp/view/admin_view/menu_admin.dart';
import 'package:act_4_community_by_ocp/view/admin_view/new_category.dart';
import 'package:act_4_community_by_ocp/view/admin_view/new_products.dart';
import 'package:act_4_community_by_ocp/view/home_view.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/view_model/home_view_model.dart';
import '../../first_page.dart';
import '../details_view.dart';

class ManagingCategory extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      //init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
        appBar: AppBar(
          flexibleSpace:GestureDetector(
              onTap: () {
                Get.to(HomeView());
              },
              child : Container(
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
              )
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Get.off(MenuAdmin());
              },
              child:
              Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )
          ),

          //*********************************************************************************************************
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
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_admin.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20,),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Ajouter un nouveau Catégories",
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: (){
                        Get.to(NewCategory());
                      },
                      icon: Icon(Icons.add_box_outlined),
                      color: primaryColor,
                      iconSize: 40,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                _searchTextFormField(),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Categories').where("name" , whereIn: [controller.valueToSearch]).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 115,
                        child: ListView.separated(
                          itemCount: snapshot.data?.docs.length??0,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: primaryColor,
                                  )
                              ),
                              width: MediaQuery.of(context).size.width * .4,
                              child: Row(
                                children: [
                                  Container(
                                    child: Container(
                                        height: 80,
                                        width: MediaQuery.of(context).size.width * .2,
                                        child: Image.network(
                                          '${snapshot.data?.docs[index]['image']}',
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 105,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        CustomText(
                                          text: '${snapshot.data?.docs[index]['name']}',
                                          alignment: Alignment.bottomLeft,
                                          fontSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: (){} ,
                                          icon: Icon(Icons.update,color: secondColor,size: 35,)
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                          onPressed: (){
                                            controller.deleteCategorys('${snapshot.data?.docs[index].id.toString()}');
                                          } ,
                                          icon: Icon(Icons.delete_forever,color: Colors.red,size: 35,)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },),
                //_listViewProductsSearched(),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "Tous les Catégories disponible",
                  color: Colors.white,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Categories').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 330,
                        child: ListView.separated(
                          itemCount: snapshot.data?.docs.length??0,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: primaryColor,
                                  )
                              ),
                              width: MediaQuery.of(context).size.width * .4,
                              child: Row(
                                children: [
                                  Container(
                                    child: Container(
                                        height: 80,
                                        width: MediaQuery.of(context).size.width * .2,
                                        child: Image.network(
                                          '${snapshot.data?.docs[index]['image']}',
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 105,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        CustomText(
                                          text: '${snapshot.data?.docs[index]['name']}',
                                          alignment: Alignment.bottomLeft,
                                          fontSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: (){} ,
                                          icon: Icon(Icons.update,color: secondColor,size: 35,)
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      IconButton(
                                          onPressed: (){
                                            controller.deleteCategorys('${snapshot.data?.docs[index].id.toString()}');
                                          } ,
                                          icon: Icon(Icons.delete_forever,color: Colors.red,size: 35,)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },),
                //_listViewProducts(),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//--------------------------------------------------------------- widgets
  final fieldText = TextEditingController();
  void clearText() {
    fieldText.clear();
  }
  Widget _searchTextFormField() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade100,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Miel, Couscous, ...',
            prefixIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            suffixIcon: IconButton(     // Icon to
              icon: Icon(Icons.clear), // clear text
              onPressed: clearText,
              color: secondColor,
            ),
          ),
          controller: fieldText,
          onChanged: (val){
            controller.setvalueToSearch(val);
          },
        ),
      ),

    );
  }


}


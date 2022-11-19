
import 'package:act_4_community_by_ocp/constance.dart';
import 'package:act_4_community_by_ocp/model/category_model.dart';
import 'package:act_4_community_by_ocp/view/home_view.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/view_model/home_view_model.dart';
import '../first_page.dart';
import 'details_view.dart';

class DetailsCategorie extends StatelessWidget {
  CategoryModel model;

  DetailsCategorie({required this.model});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      //init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          :Scaffold(
        appBar: AppBar(
          flexibleSpace:GestureDetector(
              onTap: () {
                Get.to(FirstPage());
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
                Get.off(FirstPage());
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background_Act4C4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                height: 180 ,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:
                Image.network(
                  model.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    onPressed: () {
                                      for(int i=0;i<controller.cooperativeModel.length;i++){
                                        if(controller.cooperativeModel[i].name==model.idcooperative){
                                          Get.to(DetailsCooperative(model: controller.cooperativeModel[i]));
                                        }
                                      }
                                    },
                                    color: primaryColor,
                                    child: CustomText(
                                      alignment: Alignment.center,
                                      text: 'Contactez la coopérative  :  '+model.idcooperative,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CustomText(
                          text: 'Détails',
                          fontSize: 20,
                          color: secondColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          //width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              )),
                          child: CustomText(
                            maxLine: 8,
                            text: model.description,
                            fontSize: 17,
                            height: 1.7,
                            color: secondColor,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: "PRIX ",
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  text: model.price + ' MAD',
                                  color: primaryColor,
                                  fontSize: 25,
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () async {
                                WcFlutterShare.share(
                                    sharePopupTitle: 'Share',
                                    subject: 'This is subject',
                                    text: model.image+" Ce produit "+model.name+" est just a "+model.price,
                                    mimeType: 'text/plain');
                              },
                              icon: Icon(
                                Icons.share,
                                size: 40,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),*/
                        SizedBox(
                          height: 10,
                        ),
                        _listViewProducts(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _listViewProducts() {
  return GetBuilder<HomeViewModel>(
    builder: (controller) => Container(
      height: 400,
      child: ListView.separated(
        itemCount: controller.productModelByCategory.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                DetailsView(model: controller.productModelByCategory[index],),
                transition: Transition.downToUp,
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
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
                          controller.productModelByCategory[index].image,
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 85,
                    width: 135,
                    child: Column(
                      children: [
                        CustomText(
                          text: controller.productModelByCategory[index].name,
                          alignment: Alignment.bottomLeft,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        CustomText(
                          text: controller.productModelByCategory[index].price.toString() +
                              " MAD",
                          color: primaryColor,
                          alignment: Alignment.bottomLeft,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      onPressed: (){} ,
                      icon: Icon(FontAwesomeIcons.star,color: Colors.yellow,)
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    ),
  );
}

import 'package:act_4_community_by_ocp/constance.dart';
import 'package:act_4_community_by_ocp/view/details_cooperative.dart';
import 'package:act_4_community_by_ocp/view/home_view.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../core/view_model/home_view_model.dart';
import '../first_page.dart';

class CooperativesView extends StatelessWidget {

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
                Get.off(HomeView());
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
                image: AssetImage("assets/images/Background_Act4C4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 20),
            child: Column(
              children: [
                CustomText(
                  fontSize: 18,
                  alignment: Alignment.center,
                  text: "Nos Cooperatives",
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                _listViewCooperative(),
              ],
            ),
          ),
        ),
      ),
    );
  }
//--------------------------------------------------------------- widgets

  Widget _listViewCooperative() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 590,
        child: ListView.separated(
          itemCount: controller.cooperativeModel.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsCooperative(
                  model:controller.cooperativeModel[index],
                ));
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: primaryColor,
                    )
                ),
                //width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      child: Container(
                          height: 150,
                          //width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.cooperativeModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.cooperativeModel[index].name,
                      alignment: Alignment.bottomLeft,
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.cooperativeModel[index].description,
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 30,)
        ),
      ),
    );
  }

}

import 'package:act_4_community_by_ocp/constance.dart';
import 'package:act_4_community_by_ocp/model/cooperative_model.dart';
import 'package:act_4_community_by_ocp/view/cooperativeproducts.dart';
import 'package:act_4_community_by_ocp/view/home_view.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/view_model/home_view_model.dart';
import '../first_page.dart';


class DetailsCooperative extends StatelessWidget {
  CooperativeModel model;

  DetailsCooperative({required this.model});

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<HomeViewModel>(
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
              height: 180,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  onPressed: () {
                                      controller.getSearchedProductsByCooperative(model.name);
                                      Get.to(CooperativeProducts(model : model));
                                  },
                                  color: primaryColor,
                                  child: CustomText(
                                    alignment: Alignment.center,
                                      text: 'Autre produits de : '+model.name,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Description',
                        fontSize: 20,
                        color: secondColor,
                      ),
                      SizedBox(
                        height: 10,
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
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final String _url = model.urlfacebook;
                                    if (!await launch(_url))
                                      throw 'Could not launch $_url';
                                  },
                                  icon: Icon(Icons.facebook,size: 22,),  //icon data for elevated button
                                  label: Text("Facebook"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(90 ,103 ,178, 0.9),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final String _url = "https://api.whatsapp.com/send?phone=212"+model.telephone+"&entry_point=page_cta";
                                    if (!await launch(_url))
                                      throw 'Could not launch $_url';
                                  },
                                  icon: Icon(Icons.whatsapp,size: 22,),  //icon data for elevated button
                                  label: Text("Whatsapp"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(37, 211, 102, 0.9),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 30,),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 10, 0, 8),
                        child:GestureDetector(
                          onTap: ()async {
                            final String _url = "tel:"+model.telephone;
                            if (!await launch(_url))
                              throw 'Could not launch $_url';
                          },
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.phone,
                              size: 30,
                              color: secondColor,),
                            SizedBox(
                              width: 70,
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: "Télephone",
                                  fontSize: 20,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomText(
                                  text: model.telephone,
                                  color: secondColor,
                                  fontSize: 22,
                                )
                              ],
                            ),
                            SizedBox(width: 65,),
                            Icon(Icons.arrow_forward,
                              size: 30,
                              color: secondColor,),
                          ],
                        ),
                      ),
                      ),
                      Divider(height: 30,),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 0, 8),
                        child:GestureDetector(
                          onTap: ()async {
                            final String _url = "mailto:"+model.email;
                            if (!await launch(_url))
                              throw 'Could not launch $_url';
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(FontAwesomeIcons.at,
                                    size: 30,
                                    color: secondColor,),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "Email",
                                    fontSize: 20,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  SizedBox(
                                      height: 30,
                                      width: 250,
                                      child: CustomText(
                                        text: model.email,
                                        color: secondColor,
                                        fontSize: 19,
                                        maxLine: 5,
                                      )
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(Icons.arrow_forward,
                                    size: 30,
                                    color: secondColor,),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                      Divider(height: 30,),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 0, 10),
                        child:GestureDetector(
                          onTap: ()async{
                            final String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query="+model.adresse;



                            final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

                            if (await canLaunch(encodedURl)) {
                            await launch(encodedURl);
                            } else {
                            print('Could not launch $encodedURl');
                            throw 'Could not launch $encodedURl';
                            }
                          },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(FontAwesomeIcons.locationDot,
                                size: 30,
                            color: secondColor,),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: "Google Maps",
                                  fontSize: 20,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                SizedBox(
                                    height: 50,
                                    width: 245,
                                    child: CustomText(
                                      text: model.adresse,
                                      color: secondColor,
                                      fontSize: 16,
                                      maxLine: 6,
                                    )
                                ),
                              ],
                            ),
                            SizedBox(width: 0,),
                            Icon(Icons.arrow_forward,
                              size: 30,
                              color: secondColor,),
                          ],
                        ),
                      ),
                      ),
                      Divider(height: 30,),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 10, 0, 8),
                        child:GestureDetector(
                          onTap: ()async {
                            final String _url = "sms:"+model.telephone;
                            if (!await launch(_url))
                              throw 'Could not launch $_url';
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(FontAwesomeIcons.commentSms,
                                size: 30,
                                color: secondColor,),
                              SizedBox(
                                width: 70,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "SMS",
                                    fontSize: 20,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text: model.telephone,
                                    color: secondColor,
                                    fontSize: 22,
                                  )
                                ],
                              ),
                              SizedBox(width: 65,),
                              Icon(Icons.arrow_forward,
                                size: 30,
                                color: secondColor,),
                            ],
                          ),
                        ),
                      ),
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
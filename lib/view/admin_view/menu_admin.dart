import 'package:act_4_community_by_ocp/view/admin_view/managing_category.dart';
import 'package:act_4_community_by_ocp/view/admin_view/managing_cooperative.dart';
import 'package:act_4_community_by_ocp/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constance.dart';
import 'managing_products.dart';

String logo1_path = 'assets/images/Logo1_OCP.png';
String logo2_path = 'assets/images/Logo1_OCP.png';

class MenuAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800,
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_admin.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                              Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/icon_app_OCP2.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  )
              ),
              SizedBox(
                height: 60,
              ),
              AnimatedButton(
                height: 60,
                width: 270,
                text: 'Gerer Les Produits',
                isReverse: false,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.CENTER_LR_IN,
                //textStyle: submitTextStyle,
                backgroundColor: secondColor,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
                onPress: () {
                  Get.to(ManagingProducts());
                },
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedButton(
                height: 60,
                width: 270,
                text: 'Gerer Les Coopératives',
                isReverse: true,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.CENTER_LR_IN,
                //textStyle: submitTextStyle,
                backgroundColor: secondColor,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
                onPress: () {
                  Get.to(ManagingCooperative());
                },
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedButton(
                height: 60,
                width: 270,
                text: 'Gerer Les Categories',
                isReverse: true,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.CENTER_LR_IN,
                //textStyle: submitTextStyle,
                backgroundColor: secondColor,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
                onPress: () {
                  Get.to(ManagingCategory());
                },
              ),
              SizedBox(
                height: 40,
              ),
              AnimatedButton(
                height: 60,
                width: 180,
                text: 'Se deconnecter',
                isReverse: false,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.CENTER_LR_IN,
                //textStyle: submitTextStyle,
                backgroundColor: secondColor,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
                onPress: () {
                  Get.to(HomeView());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

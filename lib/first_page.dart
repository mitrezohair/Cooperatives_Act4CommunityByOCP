import 'package:act_4_community_by_ocp/view/admin_view/managing_products.dart';
import 'package:act_4_community_by_ocp/view/admin_view/menu_admin.dart';
import 'package:act_4_community_by_ocp/view/auth/login_view.dart';
import 'package:act_4_community_by_ocp/view/auth/super_login_view.dart';
import 'package:act_4_community_by_ocp/view/home_view.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:act_4_community_by_ocp/constance.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

String logo1_path = 'assets/images/Logo1_OCP.png';
String logo2_path = 'assets/images/Logo1_OCP.png';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 820,
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_Act4C4.jpg"),
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
                height: 100,
              ),
              /*//---------------------------------- bouton ==> Je suis visiteur
              AnimatedButton(
                height: 60,
                width: 180,
                text: 'Visiteur',
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
              SizedBox(
                height: 40,
              ),
              //---------------------------------- bouton ==> Je suis Administrateur
              AnimatedButton(
                height: 60,
                width: 230,
                text: 'Administrateur',
                isReverse: true,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.CENTER_LR_IN,
                //textStyle: submitTextStyle,
                backgroundColor: secondColor,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
                onPress: () {
                  Get.to(LoginView());
                  print("Administrateur");
                },
              ),
              SizedBox(
                height: 40,
              ),
              //---------------------------------- bouton ==> Je suis Super administratuer
              AnimatedButton(
                height: 60,
                width: 270,
                text: 'Super Administrateur',
                isReverse: true,
                selectedTextColor: primaryColor,
                transitionType: TransitionType.CENTER_LR_IN,
                //textStyle: submitTextStyle,
                backgroundColor: secondColor,
                borderColor: Colors.white,
                borderRadius: 50,
                borderWidth: 2,
                onPress: () {
                  Get.to(SuperLoginView());
                  print("Super Administrateur");
                },
              ),*/

             Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final String _url = "https://web.facebook.com/A4CSafi/?_rdc=1&_rdr";
                        if (!await launch(_url))
                          throw 'Could not launch $_url';
                      },
                      icon: Icon(Icons.facebook,size: 26,),  //icon data for elevated button
                      label: Text("Facebook",),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(66 ,103 ,178, 1),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final String _url = "https://api.whatsapp.com/send?phone=212666027568&app=facebook&entry_point=page_cta";
                        if (!await launch(_url))
                          throw 'Could not launch $_url';
                      },
                      icon: Icon(Icons.whatsapp,size: 26,),  //icon data for elevated button
                      label: Text("Whatsapp"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(37, 211, 102, 1),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final String _url = "https://www.instagram.com/a4csafi/";
                        if (!await launch(_url))
                          throw 'Could not launch $_url';
                      },
                      icon: Icon(FontAwesomeIcons.instagram,size: 26,),  //icon data for elevated button
                      label: Text("Instagram"),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(193, 53, 132, 1),
                      ),
                    ),
                  ],
                ),
              SizedBox(
                height: 30,
              ),

              Container(
                height: 130,
                width: 300,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child : GestureDetector(
                  onTap: () {
                    Get.to(HomeView());
                  },
                  child: Image.asset(
                    'assets/images/next_button.png',
                    fit: BoxFit.contain,
                  ),
                )

              )

            ],
          ),
        ),
      ),
    );
  }
}

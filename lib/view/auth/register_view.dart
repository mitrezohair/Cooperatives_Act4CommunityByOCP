import 'package:act_4_community_by_ocp/first_page.dart';
import 'package:act_4_community_by_ocp/view/auth/super_login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_text.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Get.off(SuperLoginView());
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
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Create a new Administrator Account",
                      fontSize: 18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                //----------------------------------------------   Name
                CustomText(
                  text: "Name",
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
                      Icons.account_box,
                      color: Colors.black,
                      size: 20,
                    ),
                    hintText: "full name",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //----------------------------------------------   Email
                CustomText(
                  text: "Email",
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.email = value.toString();
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 20,
                    ),
                    hintText: " Act4Community@gmail.com",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //----------------------------------------------   Password
                CustomText(
                  text: "Password",
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.password = value.toString();
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                      size: 20,
                    ),
                    hintText: " **********",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    _formKey.currentState?.save();
                    if (_formKey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                  color: primaryColor,
                  child: CustomText(
                    alignment: Alignment.center,
                    text: "Create Account",
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(10),
                      onPressed: (){
                        _auth.signOut();
                        Get.to(()=>FirstPage());
                      },
                      color: primaryColor,
                      child: CustomText(
                        alignment: Alignment.center,
                        text: "Sign Out",
                        color: Colors.white,
                      ),
                    ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

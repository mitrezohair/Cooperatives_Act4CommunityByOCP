import 'package:act_4_community_by_ocp/core/view_model/auth_view_model.dart';
import 'package:act_4_community_by_ocp/first_page.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              Get.off(FirstPage());
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
                    text: "Welcome to our administrators,",
                    fontSize: 20,
                  ),
                  /*GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),*/
                ],
              ),
              SizedBox(
                //height: 10,
              ),
              CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: primaryColor,
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
                    controller.signInWithEmailAndPassword();
                  }
                },
                color: primaryColor,
                child: CustomText(
                  alignment: Alignment.center,
                  text: "Sign In",
                  color: Colors.white,
                ),
              ),
              //------------------------------------------------------------------
              /*CustomTextFormField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Password',
                hint: '**********',
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Forgot Password?',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                onPress: () {
                  _formKey.currentState?.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
                text: 'SIGN IN',
              ),*/
              //----------------------------------------------------------------------------------

              SizedBox(
                height: 40,
              ),
              CustomText(
                text: '-An administrator can manage the products',
                alignment: Alignment.center,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: '-AND-',
                alignment: Alignment.center,
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: '-Administrator can manage the Cooperatives',
                alignment: Alignment.center,
                color: Colors.grey.shade400,
              ),
              /*SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {
                  print('inchallah ghadi ta5dam');
                  //controller.facebookSignInMethod();
                },
                imageName: 'assets/images/facebook.png',
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  //controller.googleSignInMethod();
                },
                imageName: 'assets/images/google.png',
              ),*/
            ],
          ),
        ),
      ),
      ),
    );
  }
}

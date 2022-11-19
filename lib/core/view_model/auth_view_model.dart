//import 'package:act_4_community_by_ocp/core/service/firestore_user.dart';
//import 'package:act_4_community_by_ocp/model/user_model.dart';
import 'package:act_4_community_by_ocp/constance.dart';
import 'package:act_4_community_by_ocp/first_page.dart';
import 'package:act_4_community_by_ocp/model/user_model.dart';
import 'package:act_4_community_by_ocp/view/admin_view/managing_products.dart';
import 'package:act_4_community_by_ocp/view/admin_view/menu_admin.dart';
import 'package:act_4_community_by_ocp/view/auth/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import '../service/firestore_user.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;

  get user => null;

  /*Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;*/

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //_user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }



  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {} );
      Get.offAll(MenuAdmin());
      Get.snackbar(
        'Confirmation',
        'successfully identified',
        colorText: primaryColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:3),
      );
    }catch (e) {
      Get.snackbar(
        'Error login account',
        'Email or Password is incorrect',
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void SupersignInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {} );
      Get.offAll(RegisterView());
      Get.snackbar(
        'Confirmation',
        'successfully identified',
        colorText: primaryColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:3),
      );
    }catch (e) {
      Get.snackbar(
        'Error login account',
        'Email or Password is incorrect',
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds:5),
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user?.uid?.toString() ??'',
          email: user.user?.email?.toString() ??'',
          name: name ,
          pic: '',
        ));
      });
      //Get.offAll(HomeView());
    }catch (e) {
      Get.snackbar(
        'Error Creating account',
        'this account already exists',
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /*void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    ));
  }*/
}


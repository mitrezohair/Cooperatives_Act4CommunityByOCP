
import 'dart:io';
import 'package:act_4_community_by_ocp/view/admin_view/update_products.dart';
import 'package:file_picker/file_picker.dart';
import 'package:act_4_community_by_ocp/model/cooperative_model.dart';
import 'package:act_4_community_by_ocp/view/auth/login_view.dart';
import 'package:act_4_community_by_ocp/view/auth/super_login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constance.dart';
import '../../first_page.dart';
import '../../model/category_model.dart';
import '../../model/product_model.dart';
import '../service/home_services.dart';

class HomeViewModel extends GetxController {
  //Product fields
  late String  name, image, description,  price="", idcooperative='Choisissez Coopérative :', idcategory='Choisissez Catégorie :';
  late String idProductToUpdate="";
  //Cooperative fields
  late String adresse,email,tel,urlfacebook;
  late String valueToSearch="";


  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  List<ProductModel> get productModelSearched => _productModelSearched;
  List<ProductModel> _productModelSearched = [];

  List<ProductModel> get productModelByCategory => _productModelByCategory;
  List<ProductModel> _productModelByCategory = [];

  List<ProductModel> get productModelByCooperative => _productModelByCooperative;
  List<ProductModel> _productModelByCooperative = [];

  List<CooperativeModel> get cooperativeModel => _cooperativeModel;
  List<CooperativeModel> _cooperativeModel = [];

  FirebaseAuth _auth = FirebaseAuth.instance;
String val="";
  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
    getAllCooperative();
    getSearchedProducts(val);
  }
  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>)) ;
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        print(value[i].id.toString());
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }

  getSearchedProducts(String val) async {
    //_loading.value = true;
    //productModelSearched.clear();
    HomeService().getSearchedP(val).then((value) {
      for (int i = 0; i <= value.length; i++) {
          _productModelSearched.add(ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        //_loading.value = false;
      }
      print(_productModelSearched.length);
      update();
    });
  }

  getSearchedProductsByCategory(String cat) async {
    productModelByCategory.clear();
    //_loading.value = true;
    HomeService().getProductsByCategory(cat).then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModelByCategory.add(ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        //_loading.value = false;
      }
      print(_productModelByCategory.length);
      update();
    });
  }

  getSearchedProductsByCooperative(String cat) async {
    productModelByCooperative.clear();
    //_loading.value = true;
    HomeService().getProductsByCooperative(cat).then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModelByCooperative.add(ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        //_loading.value = false;
      }
      print(_productModelByCooperative.length);
      update();
    });
  }

  getAllCooperative() async {
    _loading.value = true;
    HomeService().getCooperative().then((value) {
      for (int i = 0; i < value.length; i++) {
        _cooperativeModel.add(CooperativeModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      print(_cooperativeModel.length);
      update();
    });
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Get.to(LoginView());//product
        break;
      case 1:
        Get.to(LoginView());//cooperatives
        break;
      case 2:
        Get.to(LoginView());//category
        break;
      case 3:
        Get.to(SuperLoginView());//category
        break;
      case 4:
        _auth.signOut();
        Get.to(()=>FirstPage());
        break;
    }
  }

  void setSelectedCategory(String value){
    idcategory = value;
    update();
  }

  void setSelectedCooperative(String value){
    idcooperative = value;
    update();
  }

  void setvalueToSearch(String value){
    valueToSearch = value;
    update();
  }

  void setidProductToUpdate(String value){
    idProductToUpdate = value;
    update();
  }


  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;
    pickedFile=result.files.first;
    update();
  }

  uploadFile() async{
    final path =  'products/${pickedFile?.name ?? ''}';
    final file =  File(pickedFile?.path ?? '');

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link : $urlDownload');
    image = urlDownload;
    update();
    Get.snackbar(
      'Confirmation',
      'Enregistré avec succès',
      colorText: secondColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds:3),
        icon: Icon(FontAwesomeIcons.circleCheck)
    );
    uploadTask = null;
    update();
  }

  addNewProducts() async{
    await HomeService().addProduct(name, image, description, price, idcooperative, idcategory);
  }

  addNewCategory() async{
    await HomeService().addCategory(name, image);
  }

  addNewCooperatives() async{
    await HomeService().addCooperative( adresse ,  description,  email, image, name, tel, urlfacebook );
  }

  deleteProducts(String documentId) async{
    Get.defaultDialog(
      title: "Supprimer ce produit",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Voulez-vous vraiment supprimer le produit ?',
      textCancel: "Non",
      textConfirm: "Oui",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
         HomeService().deleteProduct(documentId);
      },
    );
  }

  deleteCategorys(String documentId) async{
    Get.defaultDialog(
      title: "Supprimer cette Catégorie",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Voulez-vous vraiment supprimer la Catégorie ?',
      textCancel: "Non",
      textConfirm: "Oui",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        HomeService().deleteCategory(documentId);
      },
    );
  }x      x

  deleteCooperatives(String documentId) async{
    Get.defaultDialog(
      title: "Supprimer cette Coopérative",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Voulez-vous vraiment supprimer la Coopérative ?',
      textCancel: "Non",
      textConfirm: "Oui",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        HomeService().deleteCooperative(documentId);
      },
    );
  }

  UpdateProducts() async{
        HomeService().UpdateProduct(price,idProductToUpdate);
  }




}

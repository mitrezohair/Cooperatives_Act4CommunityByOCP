
import 'package:act_4_community_by_ocp/constance.dart';
import 'package:act_4_community_by_ocp/view/cooperatives_view.dart';
import 'package:act_4_community_by_ocp/view/details_categorie.dart';
import 'package:act_4_community_by_ocp/view/searched_product.dart';
import 'package:act_4_community_by_ocp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/view_model/home_view_model.dart';
import '../first_page.dart';
import 'details_view.dart';
import 'dart:math' as math;

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
  ];


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


        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Background_Act4C4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20,),
            child: Column(
              children: [
                _searchTextFormField(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                      text: "Categories",
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: IconButton(
                        icon: Icon(Icons.swipe_outlined,
                          size: 30,
                          color: Colors.white,),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                    _listViewCategory(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Nos Meilleure Produits",
                      fontSize: 18,
                      color: Colors.white,
                    ),
            FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(12),
              onPressed: () {
                Get.to(CooperativesView());
              },
              color: primaryColor,
              child: CustomText(
                alignment: Alignment.center,
                text: 'Nos Coopératives',
                color: Colors.white,
                fontSize: 15,
              ),
            ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //_listViewProductsSearched(),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
//--------------------------------------------------------------- widgets
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
          hintText: 'Trouvez vos produits préférés ...',
          prefixIcon: Icon(
            Icons.search,
            color: primaryColor,
          ),
        ),
        onTap: (){

          for(int i=0;i<controller.productModelSearched.length;i++){
            controller.productModelSearched.removeAt(i);
          }
            Get.to(SearchedProduct());

        },
      ),
        ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  controller.getSearchedProductsByCategory(controller.categoryModel[index].name);
              Get.to(DetailsCategorie(
                model: controller.categoryModel[index],
              ));
            },
            child : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade200,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                  color: Colors.white,
                ),
              ],
            ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 310,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsView(model: controller.productModel[index],),
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
                            controller.productModel[index].image,
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
                            text: controller.productModel[index].name,
                            alignment: Alignment.bottomLeft,
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          CustomText(
                            text: controller.productModel[index].price.toString() +
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


  //------------------------------------------------- bottomNavigationBar
 /* Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Account"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
        //currentIndex: controller.navigatorValue,
        onTap: (index) {
          //controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }*/
}


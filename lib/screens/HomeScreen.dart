import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/categorymodel.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';
import 'package:flutterweb_fooddelivery/providers/appProvider.dart';
import 'package:flutterweb_fooddelivery/providers/categoryProvider.dart';
import 'package:flutterweb_fooddelivery/providers/productProvider.dart';
import 'package:flutterweb_fooddelivery/providers/restaurantProvider.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:flutterweb_fooddelivery/screens/Details.dart';
import 'package:flutterweb_fooddelivery/screens/cartscreen.dart';
import 'package:flutterweb_fooddelivery/screens/loginScreen.dart';
import 'package:flutterweb_fooddelivery/screens/product_search.dart';
import 'package:flutterweb_fooddelivery/screens/restaurantScreen.dart';
import 'package:flutterweb_fooddelivery/widgets/ProductWidget.dart';
import 'package:flutterweb_fooddelivery/widgets/categorywidget.dart';
import 'package:flutterweb_fooddelivery/widgets/custom_text.dart';
import 'package:flutterweb_fooddelivery/widgets/laoding.dart';
import 'package:flutterweb_fooddelivery/widgets/restaurantwidget.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:async';

import 'CategoryScreen.dart';
class HomeScreen extends StatefulWidget {


  const HomeScreen({Key key, }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CategoryModel categoryModel;
  String item = '';
  FloatingSearchBarController controller = FloatingSearchBarController();
  





  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(

        appBar: AppBar(

          title:Text('app')


          ,


          actions: [



            IconButton(onPressed: () async{

              await productProvider.Search();


            }, icon: Icon(Icons.search)

            ),

            IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {

                  userProvider.reloadUserModel();


                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                }


            )

          ],


        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('signout'),
                onTap: () {
                  userProvider.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                title: Text('getorders'),
                onTap: () {
                  try {
                    productProvider.loadProductByRestaurant();
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
        body: Stack(children: [



          Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: ListView(

                children: [

                  Container(
                    height: 300,
                    width: 800,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index) {
                          if (categoryProvider != null) {
                            return GestureDetector(


                                onTap: () async {
                                  await productProvider.loadProductsByCategory(
                                      category: categoryProvider
                                          .categories[index].name);


                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          CategoryScreen(
                                            categoryModel: categoryProvider
                                                .categories[index]
                                            ,)));
                                  productProvider.loadProductsByCategory(
                                      category: categoryModel.name);
                                },
                                child: CategoryWidget(
                                  categoryModel: categoryProvider
                                      .categories[index],));
                          }
                        }, itemCount: categoryProvider.categories.length),
                  ),

                  SizedBox(height: 10,),
                  CustomText(text: 'Products',
                    size: 30,
                    weight: FontWeight.bold,
                    color: Colors.black,),

                 Container(
                   height: 200,
                   width: 800,
                   child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                       itemCount: restaurantProvider.restaurants.length,
                       itemBuilder: (context,index){

                         return RestaurantWidget(restaurant: restaurantProvider.restaurants[index],);
                       }),
                 ),
                  SizedBox(height: 10,),
                  CustomText(text: 'Products',
                    size: 30,
                    weight: FontWeight.bold,
                    color: Colors.black,),



                    Container(
                      height: 200,
                      width: 800,
                      child: ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                         itemCount: productProvider.products.length,
                         itemBuilder: (context,index){
                           return GestureDetector(
                               onTap:
                               (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(productModel: productProvider.products[index],)));
                               },



                               child: ProductWidget(productModel: productProvider.products[index]));

                   }),
                    ),


                ]),
          ),

          buildFloatingSearchBar(),


        ]));
  }


  Widget buildFloatingSearchBar() {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final productProvider = Provider.of<ProductProvider>(context);

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      controller: controller,

      onQueryChanged: (query) {
        setState(() {

          controller.query = query ;
        });


        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child:StreamBuilder<QuerySnapshot>(
              //
              stream: FirebaseFirestore.instance.collection('products').where("name",isEqualTo: controller.query).snapshots(),
                builder: (context,snapshot){
                if(snapshot.hasData){
                  return Column(children: snapshot.data.docs.map((item) => Text(item["name"])).toList(),);
        }else{
                  return null;
        }


        },


        )));
      },
    );
  }

}

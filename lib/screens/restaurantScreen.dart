import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/restaurantmodel.dart';
import 'package:flutterweb_fooddelivery/screens/Details.dart';
import 'package:flutterweb_fooddelivery/widgets/ProductWidget.dart';
import 'package:flutterweb_fooddelivery/widgets/custom_text.dart';
import 'package:flutterweb_fooddelivery/widgets/laoding.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';
import 'package:flutterweb_fooddelivery/providers/productProvider.dart';
class RestaurantScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantScreen({Key key, this.restaurantModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(

        body: SafeArea(
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Stack(
                    children: [
                      Positioned.fill(
                        child: Loading(),
                      ),
                      ClipRRect(

                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: restaurantModel.image,
                          height: 110,
                          fit: BoxFit.fill,
                          width: double.infinity,),
                      ),
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),))]),


                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // CustomText(text: ,),

                  ],
                ),
  ListView.separated(
    padding: EdgeInsets.all(10),

    shrinkWrap: true,

    itemCount: productProvider.productByRestaurant.length,
    separatorBuilder: (context, index)=>Divider(
      height: 30,

    ),
    itemBuilder: (context,index){
      return ListTile(

        minVerticalPadding: 10,
        leading: Text(productProvider.productByRestaurant[index].name),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Stack(
            children:[
              Positioned.fill(
                child: Loading(),
              ),

              FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: productProvider.productByRestaurant[index].image,
              imageCacheWidth: 50,
              imageCacheHeight: 50,
            ),
          ]),
        ),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsScreen(productModel: productProvider.products[index],)));
        },
      );
    },

  )

              ],
            )));
  }}













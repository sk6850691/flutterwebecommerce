import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';
import 'package:flutterweb_fooddelivery/models/user.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:flutterweb_fooddelivery/screens/cartscreen.dart';
import 'package:flutterweb_fooddelivery/widgets/custom_text.dart';

import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:transparent_image/transparent_image.dart';
class DetailsScreen extends StatefulWidget {
  final ProductModel productModel;


  const DetailsScreen({Key key, this.productModel}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final key = GlobalKey<ScaffoldState>();
  int quantity = 1;
  final RoundedLoadingButtonController roundedLoadingButtonController = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));
             userProvider.reloadUserModel();
             userProvider.usermodel.cart;
            },
          )

        ],
        leading: IconButton(icon: Icon(Icons.close),onPressed: (){},),
      ),
      body: SafeArea(
        child: Container(
          height: 500,
          child: Column(
            children: [
               Image.network(widget.productModel.image),
              SizedBox(
                height: 15,
              ),
              CustomText(text: "Description",size: 18,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.productModel.description),

              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: (){
                        if(quantity!= 1){
                          setState(() {
                            quantity -= 1;
                          });
                        }
                      },
                    ),
                  ),
                   RoundedLoadingButton(
                     controller:roundedLoadingButtonController,

                      child: Text('Add'+ ' '+ quantity.toString()+' '+ 'To Cart' ),

    onPressed: ()async{
                       roundedLoadingButtonController.success();
  await userProvider.addtoCart(productModel: widget.productModel,quantity: quantity);

                      }),

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: (){setState(() {
                              quantity += 1;
                            });

                        },
                      ),


                  )]


              )
            ],
          ),
        )
      ),
    );
  }
}

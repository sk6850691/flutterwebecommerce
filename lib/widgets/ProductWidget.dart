import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';
import 'package:flutterweb_fooddelivery/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:flutterweb_fooddelivery/providers/productProvider.dart';
import 'package:transparent_image/transparent_image.dart';
class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Padding(
        padding: const EdgeInsets.all(4.0),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,

          children:[
          //  CustomText(text: productModel.name,size: 20,),
           // SizedBox(
           //   width: 200,
          //  ),
            Container(
              height: 200,
              width: 250,
              child: ClipRRect(


              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: productModel.image,

                imageCacheHeight: 60,
                imageCacheWidth: 150,
              ),
          ),
            ),


        ])
      ),

    );
  }
}

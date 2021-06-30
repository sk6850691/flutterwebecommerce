import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterweb_fooddelivery/models/categorymodel.dart';
import 'package:flutterweb_fooddelivery/providers/productProvider.dart';
import 'package:flutterweb_fooddelivery/widgets/ProductWidget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';

import 'Details.dart';
class CategoryScreen extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryScreen({Key key,this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(

        child: ListView(

          children: [
            Column(
              children:productProvider.productByCategory.map((item) => GestureDetector(

                onTap: (){

                },
                child: ProductWidget(productModel: item,),
              )).toList() ,
            )
          ],
        ),
      ),
    );
  }
}

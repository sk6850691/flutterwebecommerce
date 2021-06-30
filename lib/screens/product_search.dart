import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/providers/productProvider.dart';
import 'package:flutterweb_fooddelivery/widgets/ProductWidget.dart';
import 'package:provider/provider.dart';
class ProductSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: productProvider.productsSearched.length<1?Column(
        children: [

        ],
      ):ListView.builder(
        itemCount: productProvider.productsSearched.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){

            },
            child: ProductWidget(productModel: productProvider.productsSearched[index],),
          );
        },
      ) ,
    );
  }
}

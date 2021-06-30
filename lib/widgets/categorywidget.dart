import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/categorymodel.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';
import 'package:flutterweb_fooddelivery/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'laoding.dart';
class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({Key key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(

          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: categoryModel.image,
                    fit: BoxFit.fill,
                    imageCacheWidth: 70,
                    imageCacheHeight: 70,
                  ),
                ),
              )
              ,
              CustomText(
                  text:categoryModel.name,
                size: 20,
              )
            ],
          ),

        ));
  }

}

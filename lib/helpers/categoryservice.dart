import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/categorymodel.dart';
class CategoryService{
  String collection = "categories";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future <List<CategoryModel>> getCategories({String category})async{
    return await firestore.collection(collection).where("category", isEqualTo: category).get().then((result){
      List <CategoryModel> categories = [];
      for(DocumentSnapshot category in result.docs){
        categories.add(CategoryModel.fromSnapshot(category));
      }
      return categories;
    }
    );
  }
}
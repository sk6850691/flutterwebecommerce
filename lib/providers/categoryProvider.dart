import 'package:flutter/cupertino.dart';
import 'package:flutterweb_fooddelivery/helpers/categoryservice.dart';
import 'package:flutterweb_fooddelivery/models/categorymodel.dart';

class CategoryProvider extends ChangeNotifier{
  CategoryService categoryService = CategoryService();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize(){
    _loadCategories();
  }
  _loadCategories()async{
   categories =  await categoryService.getCategories();
    notifyListeners();
  }

}
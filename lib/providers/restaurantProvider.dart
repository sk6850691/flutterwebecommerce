import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/helpers/restaurantservice.dart';
import 'package:flutterweb_fooddelivery/models/restaurantmodel.dart';
class RestaurantProvider with ChangeNotifier{
  RestaurantService restaurantService = RestaurantService();
  List <RestaurantModel> restaurants = [];
  List <RestaurantModel> searchedRestaurants = [];
  RestaurantProvider.initialize(){
    _loadRestaurant();
  }
  _loadRestaurant()async{
    restaurants = await restaurantService.getRestaurant();
    notifyListeners();

  }
  Future RestauratSearch(){


  }
}
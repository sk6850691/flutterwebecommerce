import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweb_fooddelivery/models/restaurantmodel.dart';
class RestaurantService{
 FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collection = "restaurants";

  Future<List<RestaurantModel>> getRestaurant()async{
    return await firestore.collection(collection).get().then((result){
      List <RestaurantModel> restaurants = [];
      for(DocumentSnapshot restaurant in result.docs){
        restaurants.add(RestaurantModel.fromSnapshot(restaurant));

      }
      return restaurants;
    });
  }
  Future <List<RestaurantModel>>searchRestaurants({String restaurantName}){
    String searchKey = restaurantName[0].toUpperCase() + restaurantName.substring(1);

    firestore.collection(collection).orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get().then((result){
          List<RestaurantModel> restaurants = [];
          for (DocumentSnapshot product in result.docs){
            restaurants.add(RestaurantModel.fromSnapshot(product));
          }
          return restaurants;
    });
  }
}
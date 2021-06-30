import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/OrderModel.dart';
import 'package:flutterweb_fooddelivery/models/cartitemmodel.dart';
class OrderService{
  String collection = "orders";
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  void createOrder({String userId,String id,String description, String status, List<cartItemModel> cart ,int totalPrice}){

    List<Map> convertedCart = [];
    List <String> restaurantIds = [];

    for(cartItemModel item in cart){
      convertedCart.add(item.toMap());
      restaurantIds.add(item.restaurantId);
    }

    firestore.collection(collection).doc(id).set({
      "userId":userId,
      "id": id,
      "restaurantIds":restaurantIds,
      "cart":convertedCart,
      "total": totalPrice,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "description": description,
      "status": status

    });
  }
  Future <List<OrderModel>> getUserOrders({String userId})async{
    return  firestore.collection(collection).where("userId", isEqualTo: userId)

        .get()
        .then((result){
          List <OrderModel> orders = [];
          for(DocumentSnapshot order in result.docs) {
            orders.add(OrderModel.fromSnapshot(order));
          }return orders;
    });
  }
}
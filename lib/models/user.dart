import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweb_fooddelivery/models/cartitemmodel.dart';

class UserModel{
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";


  String _id;
  String _name;
  String _email;
  List<cartItemModel> cart;


  String get name=> _name;
  String get email =>_email;
  String get id =>_id;




  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    cart = convertCartItems(snapshot.data()[CART])?? [];
  }


  List<cartItemModel> convertCartItems(List cart){
    List<cartItemModel> convertedCart =[];
    for(Map cartItem in cart){
      convertedCart.add(cartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }
}
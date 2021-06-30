

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/helpers/order.dart';
import 'package:flutterweb_fooddelivery/helpers/user.dart';
import 'package:flutterweb_fooddelivery/models/OrderModel.dart';
import 'package:flutterweb_fooddelivery/models/cartitemmodel.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';
import 'package:flutterweb_fooddelivery/models/user.dart';
import 'package:flutterweb_fooddelivery/screens/loginScreen.dart';
import 'package:uuid/uuid.dart';
enum Status{Uninitialized,Authenticated,Authenticating,Unauthenticated}
class UserProvider with ChangeNotifier{

FirebaseAuth auth;
User user;
Status _status = Status.Uninitialized;
UserModel _userModel;
List<OrderModel> orders = [];

UserModel get usermodel =>_userModel;

UserService _userService = UserService();
OrderService _orderService = OrderService();
FirebaseFirestore firestore = FirebaseFirestore.instance;

Status get status =>_status;

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
UserProvider.initialize(): auth = FirebaseAuth.instance{
  auth.authStateChanges().listen(_onAuthStateChanged);
}
Future<void> _onAuthStateChanged(User firebaseUser)async{

  if(firebaseUser == null){
    _status = Status.Unauthenticated;
  }
  else{
    user = firebaseUser;
    _status = Status.Authenticated;

  }
  notifyListeners();
}
Future<bool> signIn()async{


  try{
    _status = Status.Authenticating;
    await auth.signInWithEmailAndPassword(email: email.text,password: password.text);
  return true;
  }
  catch(e)
  {print(e);}


}
Future<bool> SignUp()async{
  try{

   await auth.createUserWithEmailAndPassword(email: email.text,password: password.text).then((result){

      firestore.collection('users2').doc(result.user.uid).set({
        'email':email.text,
        'password':password.text,
        'uid':result.user.uid,


      });});
   return true;
  }catch(e)
  {print(e);}
}
 Future signOut()async{
  await auth.signOut();
  _status = Status.Unauthenticated;
  notifyListeners();
  return Future.delayed(Duration.zero);
}

  addtoCart({ProductModel productModel, int quantity}){


  var uuid = Uuid();
  String cartItemid = uuid.v4();

  Map cartItem = {
    "id":cartItemid,
    "name":productModel.name,
    "image":productModel.image,
    "price": productModel.price,
    "quantity":quantity,


  };
  cartItemModel item = cartItemModel.fromMap(cartItem);
  _userService.addToCart(cartItem: item,userId: user.uid);
  return true;

}
Future<void> reloadUserModel()async{
 _userModel= await _userService.getUserById(user.uid);
 notifyListeners();
}
Future<bool> removeFromCart({cartItemModel cartItem})async{
  await _userService.removeFromCart(cartItem:cartItem, userId: user.uid );
  return true;
}
  Future<void> getOrders()async{

  orders = await _orderService.getUserOrders(userId: user.uid);
  notifyListeners();
}




}
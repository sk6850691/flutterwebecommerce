import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweb_fooddelivery/models/cartitemmodel.dart';
import 'package:flutterweb_fooddelivery/models/user.dart';
class UserService{
  String collection = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String,dynamic>values){
    String id = values["id"];
    _firestore.collection(collection).doc(id).set(values);
  }
 void addToCart({String userId, cartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
      "cart":FieldValue.arrayUnion([cartItem.toMap()])
    });
  }
  void removeFromCart({String userId,cartItemModel cartItem}){
    _firestore.collection(collection).doc(userId).update({
     "cart":FieldValue.arrayRemove([cartItem.toMap()])
    });

  }

  Future getUserById(String id){
    return _firestore.collection(collection).doc(id).get().then((doc){
      return UserModel.fromSnapshot(doc);
    });
  }
  void editCart({String userId, List<Map>cart}){
    _firestore.collection(collection).doc(userId).update({
      "cart":cart
    });
  }

}
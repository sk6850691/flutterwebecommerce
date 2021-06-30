import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweb_fooddelivery/providers/PaymentProvider.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';

class CardService{

  String collection = "cards";
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future createCard(token){
    fireStore.collection(collection).add({
     'tokenId':jsonEncode(token)

    }).then((val){
      print('saved');
    });
  }
}
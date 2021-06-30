import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePayment{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  uploadData(response){
    firestore.collection('cards').doc().set({
      "card": jsonEncode(response)
    });
  }
}

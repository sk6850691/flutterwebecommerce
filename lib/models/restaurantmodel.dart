

import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel{
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";


  String _id;
  String _image;
  String _name;


  get image => _image;
  get id =>_id;
  get name => _name;




  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot[ID];
    _image = snapshot[IMAGE];
    _name = snapshot[NAME];

  }

}
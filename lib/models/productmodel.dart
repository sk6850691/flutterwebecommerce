import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{

  static const ID = "id";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const Name = "name";
  static const RESTAURANTID = "restaurantId";
  static const CATEGORY = "category";
  static const DESCRIPTION = "description";



  String _image;
  String _name;
  String _category;
  String _description;
  int _price;

  get image =>_image;

  get name => _name;

  get category => _category;
  get description =>_description;
  get price =>_price;


  ProductModel.fromSnapshot(DocumentSnapshot snapshot){

    _image = snapshot[IMAGE];
    _name = snapshot[Name];

    _category = snapshot[CATEGORY];
    _description = snapshot[DESCRIPTION];
    _price = snapshot[PRICE];

  }
}
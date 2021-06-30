import 'package:cloud_firestore/cloud_firestore.dart';
class CategoryModel{
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";

  String _id;
  String _name;
  String _image;

  get image=> _image;
  get name => _name;
  get id => _id;



 CategoryModel.fromSnapshot(DocumentSnapshot snapshot){
   _id = snapshot[ID];
   _name = snapshot[NAME];
   _image = snapshot[IMAGE];
 }
}
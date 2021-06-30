import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';

class ProductService{
  String collection = "products";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProducts()async{
    return await firestore.collection(collection).get().then((result){
      List<ProductModel> products = [];
      for (DocumentSnapshot product in result.docs){
      products.add(ProductModel.fromSnapshot(product));
      }
      return products;

    });

  }

  Future <List<ProductModel>>getProductsByRestaurant({String restaurantId})async{
   return await firestore.collection(collection).where("restaurantId", isEqualTo: restaurantId).get().then((result){
      List<ProductModel> products = [];
      for(DocumentSnapshot product in result.docs){
        products.add(ProductModel.fromSnapshot(product));
      }
      return products;
    });
  }

  Future getProductsofCategory({String category})async{
    return await firestore.collection(collection).where("category", isEqualTo: category).get().then((result){
      List<ProductModel> products = [];
      for(DocumentSnapshot product in result.docs){
        products.add(ProductModel.fromSnapshot(product));
      }
      return products;
    });
  }

  Future getSearhedProducts({String productName}){


 String searchKey = productName[0].toUpperCase()+ productName.substring(1);
    firestore.collection(collection).where("name",isEqualTo: productName).get().then((result) {

      List<ProductModel>products=[];
      for(DocumentSnapshot snapshot in result.docs){
        products.add(ProductModel.fromSnapshot(snapshot));
      }
      return products;
    });


}

}
import 'package:flutter/cupertino.dart';
import 'package:flutterweb_fooddelivery/helpers/products.dart';
import 'package:flutterweb_fooddelivery/models/categorymodel.dart';
import 'package:flutterweb_fooddelivery/models/productmodel.dart';

class ProductProvider with ChangeNotifier{

  ProductService productService = ProductService();
  List <ProductModel> products = [];
  List <ProductModel> productByCategory = [];
  List <ProductModel> productByRestaurant = [];
  List <ProductModel> productsSearched = [];
  TextEditingController controller = TextEditingController();


  ProductProvider.initialize(){
    loadProducts();

  }
  loadProducts()async{
    products = await productService.getProducts();
    notifyListeners();

  }
   loadProductsByCategory({String category})async{
    productByCategory = await productService.getProductsofCategory(category: category);
    notifyListeners();



  }
   loadProductByRestaurant({String restaurantId})async{
    productByRestaurant = await productService.getProductsByRestaurant(restaurantId: restaurantId);
    notifyListeners();

}

 Future  Search()async{

    productsSearched= await  productService.getSearhedProducts(productName: controller.text);
    notifyListeners();

}


}
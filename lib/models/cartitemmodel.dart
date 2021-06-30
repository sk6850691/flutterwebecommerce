
class cartItemModel{
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const QUANTITY = "quantity";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";
  static const RESTAURANT_ID = "restaurantID";




  String _id;
  String _name;
  String _image;
  int _quantity;
  int _price;
  String _productId;
  String _restaurantId;



  String get id=> _id;
  String get name => _name;
  String get image =>_image;
  int get price => _price;
  int get quantity => _quantity;
  String get restaurantId => _restaurantId;

  cartItemModel.fromMap(Map data){

    _id = data[ID];
    _name = data[NAME];
    _image = data[IMAGE];
    _price = data[PRICE];
    _quantity = data[QUANTITY];
    _productId = data[PRODUCT_ID];
   _restaurantId = data[RESTAURANT_ID];
  }

  Map toMap()=>{
    ID: _id,
    IMAGE: _image,
    NAME: _name,
    PRODUCT_ID:_productId,

    QUANTITY: _quantity,
    PRICE:_price,

  }
  ;









}
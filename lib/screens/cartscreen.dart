import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/helpers/order.dart';
import 'package:flutterweb_fooddelivery/models/cartitemmodel.dart';
import 'package:flutterweb_fooddelivery/models/user.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:flutterweb_fooddelivery/screens/order.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:uuid/uuid.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  UserModel userModel;
  OrderService _orderService = OrderService();
  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart),
          onPressed: ()async{
            var uuid = Uuid();
            String id = uuid.v4();

            _orderService.createOrder(
                userId: userProvider.user.uid,

                description: "random descriptioin",
                status: "complete",
                id: id,
                totalPrice: 200,
                cart: userProvider.usermodel.cart);
            userProvider.getOrders();


            Navigator.push(context,MaterialPageRoute(builder: (context)=>OrderScreen()));
            print(userProvider.orders);



          }
          ) ],
        title: Text("CartScreen"),
      ),
     body:
         ListView.builder(
           itemCount: userProvider.usermodel.cart.length,
           itemBuilder: (context,index) {
             return Container(
                 height: 150,
                 child: Column(
                   children: [
                     CircleAvatar(backgroundImage: NetworkImage(
                         userProvider.usermodel.cart[index].image)),
                     Text("name :" + userProvider.usermodel.cart[index].name),
                     Text("price: " +
                         userProvider.usermodel.cart[index].price.toString()),
                     Text("quantity:" +
                         userProvider.usermodel.cart[index].quantity
                             .toString()),
                     Row(
                       children: [IconButton(
                         icon: Icon(Icons.remove),
                         onPressed: () {
                           userProvider.removeFromCart(
                               cartItem: userProvider.usermodel.cart[index]);
                         },
                       ),
                         IconButton(
                           icon: Icon(Icons.add),
                           onPressed: ()  {

                             userProvider.removeFromCart(
                                 cartItem: userProvider.usermodel.cart[index]);
                           },
                         )
                       ],
                     ),


                   ],
                 )
             );
           }),



  );






  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/OrderModel.dart';
import 'package:provider/provider.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderScreen'),
      ),
      body:ListView.builder(
        itemCount: userProvider.orders.length,
        itemBuilder: (_,index){
          OrderModel _order = userProvider.orders[index];
          return Column(
            children: [
              Text(_order.createdAt.toString()),
              Text(_order.description)
            ],
          );
        },
      )


    );
  }
}

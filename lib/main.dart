import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/providers/PaymentProvider.dart';
import 'package:flutterweb_fooddelivery/providers/appProvider.dart';
import 'package:flutterweb_fooddelivery/providers/categoryProvider.dart';
import 'package:flutterweb_fooddelivery/providers/productProvider.dart';
import 'package:flutterweb_fooddelivery/providers/restaurantProvider.dart';

import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:flutterweb_fooddelivery/screens/HomeScreen.dart';
import 'package:flutterweb_fooddelivery/screens/RegistrationScreen.dart';
import 'package:flutterweb_fooddelivery/screens/Splash.dart';
import 'package:flutterweb_fooddelivery/screens/location.dart';
import 'package:flutterweb_fooddelivery/screens/locationPicker.dart';
import 'package:flutterweb_fooddelivery/screens/loginScreen.dart';
import 'package:flutterweb_fooddelivery/screens/stripepayment.dart';
import 'package:flutterweb_fooddelivery/screens/webcheckout.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MultiProvider(
          providers:
      [
       ChangeNotifierProvider.value(value: UserProvider.initialize()),
       ChangeNotifierProvider.value(value: RestaurantProvider.initialize(),),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize(),),
        ChangeNotifierProvider.value(value: ProductProvider.initialize(),)
        ,
        ChangeNotifierProvider.value(value: AppProvider()),
        //ChangeNotifierProvider.value(value: PaymentProvider.initialize(),)
      ],



      child: MaterialApp(
        home: ScreenController()
       )));
}
class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomeScreen();
      default:
        return LoginScreen();
    }
  }
}







/*
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/screens/stripewebcheckout.dart';
class WebCheckout extends StatefulWidget {
  const WebCheckout({Key key}) : super(key: key);

  @override
  _WebCheckoutState createState() => _WebCheckoutState();
}

class _WebCheckoutState extends State<WebCheckout> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Stripe('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').redirectToCheckout(CheckoutOptions(
              lineItems: [
                LineItem(
                  price: 'someIdOftheProductFromStripeDashboard',
                  quantity: 1,
                )
              ],
              mode: 'payment',
              successUrl: 'http://localhost:8080/#/success',
              cancelUrl: 'http://localhost:8080/#/cancel',
            ));



          },
        ),
      );
  }
}
*/
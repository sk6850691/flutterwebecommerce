/*import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/helpers/paymentservice.dart';
class StripePayment extends StatefulWidget {
  @override
  _StripePaymentState createState() => _StripePaymentState();
}

class _StripePaymentState extends State<StripePayment> {
  StripeService service = StripeService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeService.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            service.payWithNewCard(amount: '600',currency: 'INR');
          },
          color: Colors.blue,
        ),
      ),
    );
  }
}
*/


/*import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterweb_fooddelivery/helpers/stripe.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart'as http;

class StripeTransactionResponse{
  String message;
  bool success;
  StripeTransactionResponse({this.message,this.success});

}
class StripeService{
  FirebasePayment firebasePayment = FirebasePayment();
  static String apiBase = "https://api.stripe.com/v1";
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String prices = '${StripeService.apiBase}/prices';

  static String secret = 'sk_test_51HIU66GRLEy3JrONUzcqtkwBmrwBkddAAwO104bPvM1SX4Bda89z8mkK0zjVn9FJZzaiB09Rvtn3RqyPNeNKCput00HzUY3gbs';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  static init(){
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: "pk_test_51HIU66GRLEy3JrONNxGciNNV7nqY3L6wKNNGORUyqp7uXsRgHbYat7aIMqaDrhaxZhl7tvMAhOEPlZFv6pj9VDvG00X4Z76En9",
        merchantId: "Test",
        androidPayMode: "test"
      )
    );
  }

  static Future <Map<String,dynamic>> getPaymentDetails()async{


  }
  static Future <Map<String,dynamic>> createPaymentIntent(String amount ,String currency)async{

      Map<String,dynamic>body = {
        'amount':amount,
        'currency':currency,
        'payment_method_types[]':'card'
      };
      /*var response = await http.post(

        //body: body,
       // headers: StripeService.headers
      );*/


  }

   StripeTransactionResponse payViiaExistingCard({String amount,String currency,card}){
    return new StripeTransactionResponse(
      message: 'TransactoinSuccessful',
      success: true
    );
  }
   Future <StripeTransactionResponse> payWithNewCard({String amount,String currency}) async {
     try {
       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
           CardFormPaymentRequest()
       );
       print(jsonEncode(paymentMethod));
       var paymentIntent = await StripeService.createPaymentIntent(
           amount, currency
       );
       //firebasePayment.uploadData(paymentMethod);


       var response = await StripePayment.confirmPaymentIntent(
           PaymentIntent(
               clientSecret: paymentIntent['client_secret'],
               paymentMethodId: paymentMethod.id
           )
       );

       if (response.status == 'succeeded') {
         return new StripeTransactionResponse(
             message: 'Transaction successful',
             success: true
         );
       } else {
         return new StripeTransactionResponse(
             message: 'Transaction Successful',
             success: true
         );
       }
     } catch (e) {
       print(e);
     }
   }}*/

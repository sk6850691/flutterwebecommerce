import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:flutterweb_fooddelivery/screens/RegistrationScreen.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: userProvider.signOut
          )
        ],
        backgroundColor: Colors.blue,
      ),body:
        Padding(
          padding: EdgeInsets.fromLTRB(2,20,2,10),
          child: Center(
            child: Column(
              children: [SizedBox(
                height: 100,
              ),
                TextFormField(
                  controller: userProvider.email



                ),
                TextFormField(

                  controller: userProvider.password

                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                  child:MaterialButton  (
                      color: Colors.blue,
                      onPressed: ()async{
                  if(!await userProvider.signIn()){
                    key.currentState.showSnackBar(
                      SnackBar(content: Text("Login Failed"),)
                    );
                  return;}

                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                }


                ),

                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>RegistrationScreen()));},
                )
              ],
            ),
          ),
        )

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/providers/userProvider.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Registration SCreen'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(2,20,2,10),
        child: Center(
          child: Column(
            children: [SizedBox(
              height: 100,
            ),
              TextFormField(
                controller: userProvider.email,

              ),
              TextFormField(
                controller: userProvider.password,

              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: ()async{
                  if(!await userProvider.SignUp()){
                    _key.currentState.showSnackBar(
                      SnackBar(content: Text('registration failed'),)
                    );
                    return;

                  }
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()));



                },
                child: Text('button',),
              )
            ],
          ),
        ),
      )

    );
  }
}

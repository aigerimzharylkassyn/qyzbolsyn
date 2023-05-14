import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'auth_page.dart'; 
import 'package:qyzbolsynapp1/pages/order_traking_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
    body: StreamBuilder<User?> (stream : FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot){
      if (snapshot.hasData)
      return  HomePage();

    

    else{
 return AuthPage();
    }
    },
    
    
    ), 

    ); 
  }
  



} 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
    const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();}


 class _ProfileScreenState extends State<ProfileScreen>{
    final user = FirebaseAuth.instance.currentUser!; 
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center ,
      children:[
        Text(
        'signed in as'+user.email!,  
        style:TextStyle(fontSize: 20),
        ),
        MaterialButton(onPressed: (){
          FirebaseAuth.instance.signOut();
        },
        color: Colors.deepPurple[200],
        child: Text('sign out'),
        )
      ]),)
   );
  }
 }

      

  
 

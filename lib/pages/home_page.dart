import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qyzbolsynapp1/pages/aqparat.dart';
import 'package:qyzbolsynapp1/pages/order_traking_page.dart';
import 'package:qyzbolsynapp1/pages/cHat.dart';
import 'package:qyzbolsynapp1/pages/duken.dart';
import 'package:qyzbolsynapp1/pages/profile_screen.dart';
import 'package:qyzbolsynapp1/pages/userpage.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);
  
  get showProfileScreen => null;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 
  void _navigateBottomBar( int index){
    setState((){
      _selectedIndex= index;
    }); 
  }
  final List<Widget> _pages = [
   OrderTrackingPage(), 
   Aqparat(), 
   ChatScreen(), 
   Duken (), 
   ProfileScreen(),


  ];
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: _pages[_selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 239, 238, 240), 
        animationDuration: Duration( milliseconds: 300),
     
        onTap: _navigateBottomBar, 

      
        items: [
       Icon(Icons.add_location_alt,
           color: Colors.black,
           size:25),  
         
           Icon(Icons.article,
            color: Colors.black,
            size:25), 
            Icon(Icons.chat_bubble_outline_outlined,
             color: Colors.black,
             size:25), 
           Icon(Icons.add_business_rounded,
            color: Colors.black,
            size:25), 
             Icon(Icons.person,
              color: Colors.black,
              size:25)
          

        ],
      ),

    );
               
                
                   
                         
                       
                   
      




      
  
  }
}
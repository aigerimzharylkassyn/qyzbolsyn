import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgot_pw_page.dart'; 
class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage; 
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
  }
  
  class _LoginPageState extends State<LoginPage> {
    // create text controller
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    Future signIn() async {
      // loading circle 
      showDialog(
        context: context, 
        builder: (context){
          return Center(child: CircularProgressIndicator()); 
        }
        ); 
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
       password: _passwordController.text.trim()
       ); 
       Navigator.of(context).pop(); 
    } 
    @override
  void dispose() {
    _emailController.dispose();
     _passwordController.dispose();

    
    super.dispose();
  }
  
 

    
    @override
    Widget build(BuildContext context) {
      return Scaffold(

         backgroundColor: Color.fromARGB(255, 229, 229, 244), 
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
      child: Column ( 
        mainAxisAlignment: MainAxisAlignment.center, 
        children:[
        const SizedBox(
              height: 300,
              width: 300,
              child:Image(image : AssetImage("assets/logo.png"), ),

            ), 
            
            Text (
              'Qoş keldıñiz!',
              style:  TextStyle(
                fontWeight: FontWeight.bold,fontFamily: "Goldplay",
                 fontSize: 36, 
              ), 
              
           
     
             ), 
             
              Text (
                'Sizben kezdeskenıme quanyştymyn!',
                style : TextStyle(
fontFamily: "Goldplay1",
                  fontSize: 20, 
                ),
        
        
              ),
              SizedBox(height: 20), 
            //hello again!
            //email textfield
            // password texrfield 
            //sign in button 
            //  ot a member register now
        Padding(
          padding: const EdgeInsets.symmetric(horizontal : 25.0),

          child:   Container(

            decoration : BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255), 
          border : Border.all(color: Color.fromARGB(255, 254, 254, 255)), 
          borderRadius :BorderRadius.circular(12), 
            ), 
            child : Padding(
          padding : const EdgeInsets.only (left: 20.0), 
            
            child :TextField( 
              controller: _emailController, 

            decoration: InputDecoration (
          border : InputBorder.none, 
          hintText: 'Email', 
            ), 
            ), 
            ),
          ),
        ), 
         SizedBox(height: 10),  
        Padding(
          padding: const EdgeInsets.symmetric(horizontal : 25.0),
          child:   Container(
            decoration : BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255), 
          border : Border.all(color: Colors.white), 
          borderRadius :BorderRadius.circular(12), 
            ), 
            child : Padding(
          padding : const EdgeInsets.only (left: 20.0), 
            
            child :TextField( 
              obscureText: true, 
              controller: _passwordController, 
            decoration: InputDecoration (
          border : InputBorder.none, 
          hintText: 'Qūpia söz ', 
            ), 
            ), 
            ),
          ),
        ), 
        SizedBox(height: 10), 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ForgotPasswordPage(); 

                  },),
                  );
                }, 
                child: Text('Qūpia sözdı ūmyttyñyz ba?', 
                style : TextStyle (
                  color : Colors.purple[300], 
                  fontWeight: FontWeight.bold, 
                ), 
                ),
              ),
            ],
          ),
        ), 
        SizedBox(height: 10), 
        Padding (
          padding : const EdgeInsets.symmetric(horizontal: 25.0), 
      child: GestureDetector( 
        onTap: signIn, 
            child: Container(
               padding: EdgeInsets.all(20),
              decoration: BoxDecoration ( color: Colors.purple[300], 
              borderRadius: BorderRadius.circular(50)), 
          
              child: Center (child: Text( 
                'Kiru',
                style: TextStyle (color: Colors.white, 
             fontFamily: "Goldplay2",
                 fontSize: 18, 
                 ), 
            ), 
              ), 
            ),), 
        
        ), 
        
        
          
       
     
       
         SizedBox(height: 25),
        

        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text ( 'Akkauntyñyz joq pa?',
            style : TextStyle (
              color : Colors.black, 
              fontWeight: FontWeight.bold, 
            ),
            ),
            GestureDetector(
              onTap: widget.showRegisterPage, 

              child: Text (' Tırkelu', 
              style : TextStyle (
                color : Colors.purple[300], 
                fontWeight: FontWeight.bold, 
              ), 
              ),
            )
          ],
        ), 
        ], 
          ), 
       
        ), ),
       
      
      ), 

    

      );
     
    }
  }
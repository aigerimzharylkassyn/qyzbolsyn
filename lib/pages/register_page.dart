import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
final VoidCallback showLoginPage; 

  const RegisterPage({Key? key,
  required this.showLoginPage}) : super(
    key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmpasswordController = TextEditingController(); 
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController(); 
    final _ageController = TextEditingController();
    @override
  void dispose() {
    _emailController.dispose();
     _passwordController.dispose();
     _confirmpasswordController.dispose(); 
     _ageController.dispose();
     _firstNameController.dispose(); 
     _lastNameController.dispose();

    super.dispose();
  }
  Future signUp() async {
if (passwordConfirmed() ) {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email: _emailController.text.trim(),
   password: _passwordController.text.trim(),
   ); 
   addUserDetails(
    _firstNameController.text.trim(),
    _lastNameController.text.trim(),
    _emailController.text.trim(),
    int.parse(_ageController.text.trim()), 
   );
}
  }
  Future addUserDetails(String firstName, String lastName,String email,int age) async {
    await FirebaseFirestore.instance.collection('users').add({
    'first name' : firstName, 
    'last name': lastName , 
    'email': email ,
    'age': age , 



  }) ; 
  }  
  bool  passwordConfirmed()  {
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){ 
  return true ; 
  } else {
    return false;
  }} 
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
        
            Text (
              'Qoş keldıñiz!',
              style:  TextStyle(
                fontWeight: FontWeight.bold, 
                 fontSize: 36, 
              ), 
              
           
     
             ), 
           Text (
                'Paraqşa qūru',
                style : TextStyle(
                  fontSize: 20, 
                ),
        
        
              ),
            SizedBox(height: 30), 
            //hello again!
            //email textfield
            // password texrfield 
            //sign in button 
            //  ot a member register now

            // first name field 
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
              controller: _firstNameController, 

            decoration: InputDecoration (
          border : InputBorder.none, 
          hintText: 'Atyñyz', 
            ), 
            ), 
            ),
          ),
        ), 
         SizedBox(height: 10),  
         // last name textfield 
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
              controller: _lastNameController, 

            decoration: InputDecoration (
          border : InputBorder.none, 
          hintText: 'Tegıñız', 
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
              controller: _ageController, 

            decoration: InputDecoration (
          border : InputBorder.none, 
          hintText: 'Jasyñyz', 
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
        //confirm password textfield 
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
              controller: _confirmpasswordController, 
            decoration: InputDecoration (
          border : InputBorder.none, 
          hintText: 'Qūpia sözdı qūptau ', 
            ), 
            ), 
            ),
          ),
        ), 
        SizedBox(height: 10), 
       
       
        Padding (
          padding : const EdgeInsets.symmetric(horizontal: 25.0), 
      child: GestureDetector( 
        onTap: signUp, 
            child: Container(
               padding: EdgeInsets.all(20),
              decoration: BoxDecoration ( color: Colors.purple[300], 
              borderRadius: BorderRadius.circular(50)), 
          
              child: Center (child: Text( 
                'Jaña akkaunt qūru',
                style: TextStyle (color: Colors.white, 
                 fontWeight: FontWeight.bold,
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
            Text ( 'Akkauntyñyz bar ma?',
            style : TextStyle (
              color : Colors.black, 
              fontWeight: FontWeight.bold, 
            ),
            ),
            GestureDetector(
              onTap: widget.showLoginPage, 

              child: Text (' Kiru', 
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
  

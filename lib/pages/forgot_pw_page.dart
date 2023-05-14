import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
final _emailController = TextEditingController(); 
@override
  void dispose() {
    _emailController.dispose(); 
    
    super.dispose();
  }
Future passwordReset() async {
 try {
   await FirebaseAuth.instance
   .sendPasswordResetEmail(email: _emailController.text.trim()); 
   showDialog(
    context: context,
     builder: (context){
      return AlertDialog(
        content: Text(' Qūpia sözdı qalpyna keltıru sıltemesı jıberıldı! Elektrondyq poştañyzdy tekserıñız '),
        );
     }
     );
} on FirebaseAuthException catch (e) {
  print(e); 
  showDialog(
    context: context,
     builder: (context){
      return AlertDialog(
        content: Text(e.message.toString()),
        );
     }
     );
}
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 229, 229, 244), 
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        elevation: 0,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
              height: 200,
              width: 200,
              child:Image(image : AssetImage("assets/logo.png"), ),

            ), 

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Qobaljymañyz, bärın qalpyna keltıruge bolady! Poştañyzdy engızıñız', 
          style : TextStyle(
fontFamily: "Goldplay1",
                  fontSize: 20, 
                ),
          textAlign: TextAlign.center,
          ),
        ), 
        SizedBox(height:10), 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal : 25.0),
child :TextField( 
              controller: _emailController, 
           decoration : InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide : BorderSide(color: Colors.purple
              ), 
               borderRadius :BorderRadius.circular(12), 
            ),
            hintText: 'Email', 
            fillColor: Color.fromARGB(255, 255, 255, 255),
            filled:true, 
        
            ), 
),
        ), 
                SizedBox(height:20), 
              

            MaterialButton(
              onPressed: passwordReset, 

            child: Container( 
              padding:EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.purple[300],
              borderRadius: BorderRadius.circular(50)),
              child: Text(
                'Qūpia sözdı qalpyna keltıru',
              style: TextStyle(color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize:15,)
            
            
            ), 
            )

            )
      ], 
      ),
    );
  } }

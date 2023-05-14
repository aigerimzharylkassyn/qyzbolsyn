import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/constants.dart';
import '../services/assets_manager.dart';
import '../widgets1/chat_widget.dart';


class ChatScreen extends StatefulWidget{
  const ChatScreen({Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen>{
  final bool _isTyping=true; 
  late TextEditingController textEditingController;
  @override
  void initState(){
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 229, 229, 244), 
appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 219, 148, 223),
  elevation:2,
  leading:Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Image.asset(AssetsManager.openaiLogo),
),title: const Text("Saia"), 
actions: [ 
  IconButton(
    onPressed: () async {
      await showModalBottomSheet(context: context, builder: (context){
        return Row(children: [],); 
     } );
    

    },
 icon: const Icon(Icons.more_vert_rounded, color: Colors.white)
 ),
 ],
),
    body: SafeArea(
   
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder:(context, index ){
                return  ChatWidget(
                  msg: chatMessages[index]["msg"].toString(), 
                  chatIndex: 
                  int.parse(
                    chatMessages[index]["chatIndex"].toString()),
                ); 
          
              }
              ),
          ),
          if(_isTyping) ...[
            const SpinKitThreeBounce(color:Colors.black,
            size:18, ),
            SizedBox(height:15,),
            Material(
              color: cardColor, 

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Expanded(child: TextField(controller: textEditingController,
                  onSubmitted: (value){
                    //TODO send message
                  } ,
                  decoration: const InputDecoration.collapsed(hintText: "How can I help you", hintStyle: TextStyle(color:Color.fromARGB(255, 204, 133, 217))),
                  ),),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.send,color:Colors.black))
                ],
                ),
              ),
            )
          ]
        ],
    )
    ), 
    ); 
}
}





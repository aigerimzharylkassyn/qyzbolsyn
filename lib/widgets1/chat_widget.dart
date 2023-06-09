import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qyzbolsynapp1/constants/constants.dart';
import 'package:qyzbolsynapp1/services/assets_manager.dart';
import 'package:qyzbolsynapp1/widgets1/text_widget.dart';

class ChatWidget extends StatelessWidget {
const ChatWidget({Key? key,  required this.chatIndex, required this.msg});
final String msg;
final int chatIndex; 
  @override
  Widget build(BuildContext context) {
    return   Column( children: [
      Material(
        color:chatIndex==0 ? scaffoldBackgroundColor: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
            Image.asset(
              chatIndex==0? AssetsManager.userImage: AssetsManager.botImage,
              
              height:30,
              width: 30,
              ),
              const SizedBox(
             width : 8,),

               Expanded(
                 child: TextWidget(
                  label:msg,
               
                  ),
               ),
               chatIndex ==0
               ? const SizedBox.shrink()
               : Row(mainAxisAlignment: MainAxisAlignment.end,
               mainAxisSize: MainAxisSize.min,
               children: const [
                Icon(
                  Icons.thumb_up_alt_outlined, 
                  color:Colors.black,

                ),
                SizedBox(width:5,
                ),
                Icon(Icons.thumb_down_alt_outlined, 
                  color:Colors.black,)

               ],
               )

              
          ],),
        ),
      )
    ],);
   
}}
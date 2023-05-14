import 'package:flutter/material.dart';

const String google_api_key = "AIzaSyCbv0FvCFw18DVl8xVKgEGB4tJHTMd5OBQ";
const Color primaryColor = Color(0xFF7B61FF);
const double defaultPadding = 16.0; 

Color scaffoldBackgroundColor=Color.fromARGB(255, 229, 229, 244);
Color cardColor = Color.fromARGB(255, 255, 255, 255); 
final chatMessages = [
      {
        "msg": "Hello who are you?",
        "chatIndex": 0,
      },
      {
        "msg":
            "Hello, I am Saia, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
        "chatIndex": 1,
      },
      {
        "msg": "What is your oppportunities?",
        "chatIndex": 0,
      },
      {
        "msg":
            "I can answer questions, provide guidance, and offer support to users who may be facing difficult situations.",
        "chatIndex": 1,
      },
      {
        "msg": "Okay thanks",
        "chatIndex": 0,
      },
      {
        "msg":
            "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
        "chatIndex": 1,
      },];
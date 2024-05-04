// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add("User: $message");
    });
    // يمكنك هنا إرسال الرسالة إلى السائق عبر خادمك أو أي وسيلة أخرى.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: TextStyle(color: const Color.fromARGB(255, 7, 0, 0)), // تحديد لون النص في الشريط
        ),
        backgroundColor: Color.fromARGB(255, 24, 107, 27), // تحديد لون الشريط
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 250, 248),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        fillColor: Color.fromARGB(255, 24, 107, 27), // تحديد لون خلفية الحقل
                        filled: true,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      String message = _messageController.text.trim();
                      if (message.isNotEmpty) {
                        _sendMessage(message);
                        _messageController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatPage(),
  ));
}

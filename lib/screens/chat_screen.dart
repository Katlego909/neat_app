import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _handleSubmitted(String text) {
    final now = DateTime.now();
    final formattedTime = DateFormat('h:mm a').format(now);
    setState(() {
      _messages.add(Message(
        text: text,
        timestamp: formattedTime,
        isSentByMe: true,
      ));
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message.isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Column(
                        crossAxisAlignment: message.isSentByMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 250),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 14.0),
                            decoration: BoxDecoration(
                              color: message.isSentByMe
                                  ? Colors.blueAccent
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.text,
                                  style: TextStyle(
                                      color: message.isSentByMe
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  message.timestamp,
                                  style: TextStyle(
                                    color: message.isSentByMe
                                        ? Colors.white70
                                        : Colors.black54,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            message.isSentByMe ? 'You' : 'User',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: _handleSubmitted,
                      decoration: InputDecoration(
                        hintText: 'Enter your message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_controller.text),
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

class Message {
  final String text;
  final String timestamp;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.timestamp,
    required this.isSentByMe,
  });
}

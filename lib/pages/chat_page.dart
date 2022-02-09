import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat_private/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();

  late FocusNode focusNode;

  List<ChatMessage> _messages = [];
  bool _writing = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: const Text(
                'Da',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue.shade100,
              maxRadius: 14,
            ),
            const SizedBox(height: 3),
            const Text(
              'David Garcia',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              itemCount: _messages.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            Container(
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.only(top: 5.0),
                  alignment: Alignment.center,
                  child: TextField(
                    maxLines: 5,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Escribe un mensaje...',
                    ),
                    controller: _textController,
                    onSubmitted: _handleSubmit,
                    onChanged: (String text) {
                      setState(() {
                        _writing = text.trim().isNotEmpty;
                      });
                    },
                    focusNode: focusNode,
                    textInputAction: TextInputAction.newline,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Enviar'),
                      onPressed: _writing
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    )
                  : IconTheme(
                      data: IconThemeData(color: Colors.blue.shade400),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(Icons.send),
                        onPressed: _writing
                            ? () => _handleSubmit(_textController.text.trim())
                            : null,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    _textController.clear();
    focusNode.requestFocus();
    final newMessage = ChatMessage(
      text: text,
      uid: '123',
      animationController: AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    newMessage.animationController.forward();
    _messages.insert(0, newMessage);
    setState(() {
      _writing = false;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_widgets/custom_text_field.dart';
import '../custom_widgets/message_bubble.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  List<Map<String, dynamic>> messages = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'MESSAGES',
              style: TextStyle(fontSize: 24.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  //reverse: true,
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    //messages.reversed.toList();
                    return MessageBubble(
                      name: messages[index]['name'],
                      description: messages[index]['description'],
                    );
                  },
                ),
              ),
            ),
            const Divider(
              height: 1.0,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'SEND ME A MESSAGE',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  CustomTextField(
                    controller: _messageController,
                    maxLines: 5,
                    hintText: 'MESSAGE',
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _nameController,
                          maxLines: 1,
                          hintText: 'NAME',
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_nameController.text != '' &&
                              _messageController.text != '') {
                            setState(() {
                              messages.add(
                                {
                                  'name': _nameController.text,
                                  'description': _messageController.text,
                                },
                              );
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            });
                          }
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: Color(0xFF00FF85),
                        ),
                      )
                    ],
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

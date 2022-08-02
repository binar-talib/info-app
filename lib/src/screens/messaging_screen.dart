import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:info_app/src/networking/services.dart';

import '../custom_widgets/custom_text_field.dart';
import '../custom_widgets/message_bubble.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  List<QuerySnapshot<Map<String, dynamic>>> messages = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Services _services = Services();

  getData() {
    var q = FirebaseFirestore.instance.collection('messages').snapshots();
    print(q);
  }

  @override
  Widget build(BuildContext context) {
    getData();
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
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        //reverse: true,
                        controller: _scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          //messages.reversed.toList();

                          return MessageBubble(
                            name: snapshot.data!.docs[index]['name'],
                            description: snapshot.data!.docs[index]['message'],
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
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
                            _services.addMessage(
                              _nameController.text,
                              _messageController.text,
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Color(0xFF00FF85),
                          size: 30,
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

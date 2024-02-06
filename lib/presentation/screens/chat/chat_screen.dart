import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_filed_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pps.whatsapp.net/v/t61.24694-24/368260891_836866098031658_5086002646291443412_n.jpg?ccb=11-4&oh=01_AdRPFX6zNulo1_WQdPoE9lkJNC84K5anpj8oxY6otOmJeQ&oe=65207942&_nc_sid=000000&_nc_cat=106'),
          ),
        ),
        title: const Text('Amorcito'),
        centerTitle: false,
      ),
      body: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return (index % 2 == 0) ? const HerMessageBubble() : const MyMessageBubble();
              },
            )),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}

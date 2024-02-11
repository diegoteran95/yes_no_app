import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
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
                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQbHOJ4KfZILta-mI8ZaQlY8uiWZHdLqTlemYLIOe7vCGB0yO9m'),
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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollCtrl,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message,)
                    : MyMessageBubble(message: message,);
              },
            )),
            MessageFieldBox(onValue: chatProvider.sendMessage)
          ],
        ),
      ),
    );
  }
}

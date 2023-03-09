library flutter_chat_widget;
import 'package:flutter/material.dart';
import 'package:flutter_chat_widget/triangle_widget.dart';
import 'dart:math' as math;
import 'chat_colors.dart';

class MessageBar extends StatefulWidget {
  const MessageBar({Key? key, required this.onCLicked}) : super(key: key);

  final Function(String) onCLicked;

  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(50))
            ),
            child: Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(child: TextField(
                  controller: textEditingController,
                  onChanged: (text) {

                  },
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration.collapsed(
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 18),
                      hintText: "Message",
                      fillColor: Colors.white70),

                ),),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.attachment, color: Colors.blueGrey,),),
                const SizedBox(width: 10,),
              ],
            ),
          )),
          FloatingActionButton.small(
            backgroundColor: Theme.of(context).primaryColor,
            tooltip: '',
            child: const Icon(Icons.send_rounded, color: Colors.white,),
            onPressed: () {
              if(textEditingController.text.trim().isNotEmpty) {
                widget.onCLicked.call(textEditingController.text.toString());
                textEditingController.clear();
              }
            },
          )
        ],
      ),
    );
  }
}


class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage(
      {Key? key,
        required this.message,
        this.background = ChatColors.received,
        this.textColor = Colors.black})
      : super(key: key);

  final String message;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(10, 5, 25, 5),
      child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: CustomPaint(
                  painter: Triangle(background),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.toString(),
                        style: TextStyle(
                            color: textColor,
                            fontFamily: 'Montserrat',
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class SentMessage extends StatelessWidget {
  const SentMessage({
    Key? key,
    required this.message,
    this.background = Colors.blueAccent,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String message;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(25, 5, 10, 5),
      child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        message.toString(),
                        style: TextStyle(
                            color: textColor,
                            fontFamily: 'Montserrat',
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              CustomPaint(painter: Triangle(background)),
            ],
          )),
    );
  }
}

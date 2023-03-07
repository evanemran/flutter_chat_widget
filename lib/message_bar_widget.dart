import 'package:flutter/material.dart';

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

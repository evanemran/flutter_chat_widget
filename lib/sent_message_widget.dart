import 'package:flutter/material.dart';
import 'package:flutter_chat_widget/triangle_widget.dart';

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

import 'package:flutter/material.dart';
import 'package:flutter_chat_widget/chat_colors.dart';

import 'dart:math' as math;

import 'package:flutter_chat_widget/triangle_widget.dart';

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

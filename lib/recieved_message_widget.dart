import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:flutter_chat_widget/triangle_widget.dart';

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key, required this.message, this.background = Colors.black12, this.textColor = Colors.black
  }) : super(key: key);

  final String message;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                      style: TextStyle(color: textColor, fontFamily: 'Montserrat', fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

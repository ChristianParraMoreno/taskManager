import 'package:flutter/material.dart';

class DialogAnswer extends StatelessWidget {
  const DialogAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 100,
        child: Column(children: [
          TextField(),
        ]),
      ),
    );
  }
}

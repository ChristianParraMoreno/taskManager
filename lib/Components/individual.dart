import 'package:flutter/material.dart';

class Individual extends StatelessWidget {
  final String taskName;
  final bool completedTask;
  Function(bool?) onChanged;

  Individual(
      {super.key,
      required this.taskName,
      required this.completedTask,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(19),
        decoration: const BoxDecoration(color: Color(0xFF78281D)),
        child: Row(
          children: [
            Checkbox(
              checkColor: const Color(0xFF78281D),
              value: completedTask,
              onChanged: onChanged,
              activeColor: Colors.white,
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Lato',
                  decoration: completedTask
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}

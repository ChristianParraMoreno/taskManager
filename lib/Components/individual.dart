import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Individual extends StatelessWidget {
  final String taskName;
  final bool completedTask;
  Function(bool?) onChanged;
  Function(BuildContext)? deleteTask;

  Individual({
    super.key,
    required this.taskName,
    required this.completedTask,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_forever,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(19),
          decoration: BoxDecoration(color: Colors.lightBlue),
          child: Row(
            children: [
              Checkbox(
                value: completedTask,
                onChanged: onChanged,
                activeColor: Colors.amber,
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: completedTask
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

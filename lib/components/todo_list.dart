import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteFunction;

  TodoList(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onchanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, right: 140),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(20),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              Text(
                taskname,
                style: TextStyle(
                    color: Colors.white,
                    decoration: taskcompleted
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

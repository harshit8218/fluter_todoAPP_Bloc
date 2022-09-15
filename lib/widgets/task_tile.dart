import 'package:flutter/material.dart';
import 'package:flutter_task_app/blocs/bloc_exports.dart';
import 'package:flutter_task_app/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration:
                task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(task: task));
        },
        value: task.isDone,
      ),
      onLongPress: () {
        context.read<TasksBloc>().add(DeleteTask(task: task));
      },
    );
  }
}

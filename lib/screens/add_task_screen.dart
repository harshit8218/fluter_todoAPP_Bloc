import 'package:flutter/material.dart';
import 'package:flutter_task_app/models/task.dart';
import 'package:flutter_task_app/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true, //* make our text field active
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),  
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      var task = Task(
                        title: titleController.text,
                        id: GUIDGen.generate(),                //** it return id in string format */
                      );
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: const Text('Add')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

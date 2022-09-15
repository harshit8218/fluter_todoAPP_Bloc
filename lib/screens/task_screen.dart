import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/add_task_screen.dart';
import 'package:flutter_task_app/screens/my_drawer.dart';
import 'package:flutter_task_app/widgets/tasks_list.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context, 
        builder: (context) => const SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  _addTask(context);
                },
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.allTasks.length} Tasks'),
                ),
              ),
              TasksList(tasksList: tasksList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

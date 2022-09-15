import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/my_drawer.dart';
import 'package:flutter_task_app/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTasks.length}'),
                ),
              ),
              TasksList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}

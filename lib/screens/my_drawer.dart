import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/recycle_bin.dart';
import 'package:flutter_task_app/screens/task_screen.dart';
import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 65,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.green[100],
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),

            //** when we need a state of a bloc : Just wrap with  BlocBuilder */

            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(TaskScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(
              height: 15,
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Recycle Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
          ], 
        ),
      ),
    );
  }
}

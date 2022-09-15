import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/recycle_bin.dart';
import 'package:flutter_task_app/screens/task_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    //** here we give static id for each screens that we navigate */
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TaskScreen(),
        );
      default:
        return null;
    }
  }
}

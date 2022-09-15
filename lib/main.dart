//import 'dart:developer';
import 'package:flutter/material.dart';
//import 'package:flutter_task_app/app/app_bloc_observer.dart';
import 'package:flutter_task_app/screens/task_screen.dart';
import 'package:flutter_task_app/services/app_router.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  //Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    ),
    storage: storage,
  );
}

// runZonedGuarded(
//   () => runApp(const MyApp()),
//   (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
// );

// runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TaskScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

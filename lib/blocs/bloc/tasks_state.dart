part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  //** List of Task  */
  final List<Task> allTasks;
  final List<Task> removedTasks;

  //** in constructor we initialize it as a empty task list
  const TasksState({
    this.allTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, removedTasks];

  // Hydrated Bloc:
  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'remocedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}

class TasksInitial extends TasksState {}

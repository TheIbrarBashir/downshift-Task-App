import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/domain/bloc/task_bloc/task_state.dart';

import '../../models/task.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());

  final List<Task> _tasks = [];

  static TaskCubit get(context) => BlocProvider.of(context);

  void addTask({required Task projectModel}) {
    // Todo: Sqlite implementation
    _tasks.add(projectModel);
    emit(state.copyWith(tasks: List.from(_tasks)));
  }

  void deleteTask({required String? title}) {
    _tasks.removeWhere((element) => element.title == title);
    emit(state.copyWith(
      tasks: List.from(_tasks),
    ));
  }
}

import 'package:equatable/equatable.dart';

import '../../../domain/models/task.dart';

enum ProcessingStatus { init, loading, success, error }

class TaskState extends Equatable {
  final List<Task>? tasks;
  final ProcessingStatus status;

  const TaskState({
    this.status = ProcessingStatus.init,
    this.tasks,
  });

  @override
  List<Object?> get props => [tasks, status];

  TaskState copyWith({
    List<Task>? tasks,
    ProcessingStatus? status,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_app/domain/bloc/task_bloc/task_cubit.dart';
import 'package:task_manager_app/domain/bloc/task_bloc/task_state.dart';
import 'package:task_manager_app/domain/models/task.dart';

void main() {
  group('TaskCubit', () {
    late TaskCubit taskCubit;

    setUp(() {
      taskCubit = TaskCubit();
    });

    tearDown(() {
      taskCubit.close();
    });

    test('emits correct state after adding a task', () {
      // Arrange
      final task = Task(title: 'Test Task', details: 'Test Description');

      // Act
      taskCubit.addTask(projectModel: task);

      // Assert
      expect(
        taskCubit.state,
        equals(TaskState(tasks: [task])),
      );
    });

    test('emits correct state after deleting a task', () {
      // Arrange
      final task1 = Task(title: 'Task 1', details: 'Description 1');
      final task2 = Task(title: 'Task 2', details: 'Description 2');
      taskCubit.addTask(projectModel: task1);
      taskCubit.addTask(projectModel: task2);

      // Act
      taskCubit.deleteTask(title: 'Task 1');

      // Assert
      expect(
        taskCubit.state,
        equals(TaskState(tasks: [task2])),
      );
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/view/home_screen/widgets/input_project_info.dart';
import '../../domain/bloc/task_bloc/task_cubit.dart';
import '../../domain/bloc/task_bloc/task_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('All Task'),
      ),
      body: SafeArea(
        child: BlocBuilder<TaskCubit, TaskState>(
          bloc: context.read<TaskCubit>(),
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: (state.tasks ?? []).length,
              itemBuilder: (context, index) => Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                // Adjust margin as needed
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  // Set your background color here
                  borderRadius:
                      BorderRadius.circular(10.0), // Set border radius here
                ),

                child: ListTile(
                  onTap: () {},
                  trailing: IconButton(
                    onPressed: () {
                      context.read<TaskCubit>().deleteTask(
                          title: state.tasks?.elementAt(index).title);
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ),
                  ),
                  title: Text((state.tasks ?? []).elementAt(index).title ?? '',
                      style: Theme.of(context).textTheme.headlineSmall),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((state.tasks ?? []).elementAt(index).details ?? '',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleSmall),
                      Text(
                        DateFormat().format(
                            (state.tasks ?? []).elementAt(index).timeStamp!),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog(context);
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

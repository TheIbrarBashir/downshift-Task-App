import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/bloc/task_bloc/task_cubit.dart';
import '../../../domain/models/task.dart';

void showAddTaskDialog(BuildContext context) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String title = '';
  String details = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Task'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Details'),
                  onSaved: (value) {
                    details = value ?? '';
                  },
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Add'),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<TaskCubit>().addTask(
                    projectModel: Task(
                        title: title,
                        details: details,
                        timeStamp: DateTime.now()));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

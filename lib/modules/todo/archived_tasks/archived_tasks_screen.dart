import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/todo_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/todo_cubit/cubit.dart';

class ArchivedTasksScreen extends StatefulWidget {
  const ArchivedTasksScreen({super.key});

  @override
  State<ArchivedTasksScreen> createState() => _ArchivedTasksScreenState();
}

class _ArchivedTasksScreenState extends State<ArchivedTasksScreen> {
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = AppCubit.get(context).archivedTasks;
          return ListView.separated(
            padding: EdgeInsets.all(8.0), // padding around the grid
            itemCount: tasks.length, // total number of items
            itemBuilder: (context, index)  => taskBuilder(tasks[index],context,archive:"done")
            ,
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 2),
            ),
          );
        });
  }
}
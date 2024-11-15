import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/todo_cubit/cubit.dart';
import 'package:bmi/shared/cubit/todo_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneTasksScreen extends StatefulWidget {
  const DoneTasksScreen({super.key});

  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = AppCubit.get(context).doneTasks;
          return ListView.separated(
            padding: EdgeInsets.all(8.0), // padding around the grid
            itemCount: tasks.length, // total number of items
            itemBuilder: (context, index)  => taskBuilder(tasks[index],context,check: "on going",)
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
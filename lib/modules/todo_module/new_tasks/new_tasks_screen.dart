// ignore_for_file: unused_import

import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/todo_cubit/cubit.dart';
import 'package:bmi/shared/cubit/todo_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/shared/components/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var tasks = AppCubit.get(context).tasks;
          return ListView.separated(
            padding: EdgeInsets.all(8.0), // padding around the grid
            itemCount: tasks.length, // total number of items
            itemBuilder: (context, index)  => taskBuilder(tasks[index],context)
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

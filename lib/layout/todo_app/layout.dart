// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/todo_cubit/cubit.dart';
import 'package:bmi/shared/cubit/todo_cubit/states.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (BuildContext context, AppState state) {
        if (state is AppInsertDatabaseState) {
          Navigator.pop(context);
        }
        if (state is AppGetDatabaseState) {
          print("tasks get successfully");
        }
      }, builder: (BuildContext context, AppState state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.pageIndex],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    print("inserting into db");
                    cubit.insertToDatabse(
                      database: cubit.database!,
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                    titleController.clear();
                    timeController.clear();
                    dateController.clear();
                  }
                } else {
                  cubit.changeButtomSheetState(isShow: true, icon: Icons.add);

                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          width: double.infinity,
                          color: Colors.grey[100],
                          padding: EdgeInsets.all(12),
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaulftFormField(
                                  controller: titleController,
                                  onSubmit: (value) {},
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "title must not be empty";
                                    }
                                    return null;
                                  },
                                  prefixIcon: Icon(Icons.task),
                                  label: "task title",
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                defaulftFormField(
                                    label: "task time",
                                    type: TextInputType.datetime,
                                    prefixIcon: Icon(Icons.watch),
                                    controller: timeController,
                                    ontap: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Container(
                                          height: 200,
                                          color: Colors.white,
                                          margin: EdgeInsets.only(bottom: 100),
                                          child: CupertinoDatePicker(
                                            onDateTimeChanged: (val) {
                                              timeController.text =
                                                  DateFormat.Hm().format(val);
                                            },
                                            mode: CupertinoDatePickerMode.time,
                                            initialDateTime: DateTime.now(),
                                            use24hFormat: true,
                                          ),
                                        ),
                                      );
                                    },
                                    onSubmit: (value) {},
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "time must be picked";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 8,
                                ),
                                defaulftFormField(
                                    label: "pick date",
                                    type: TextInputType.datetime,
                                    prefixIcon: Icon(Icons.calendar_month),
                                    controller: dateController,
                                    ontap: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Container(
                                          color: Colors.white,
                                          height: 200,
                                          margin: EdgeInsets.only(bottom: 40),
                                          child: CupertinoDatePicker(
                                            onDateTimeChanged: (val) {
                                              dateController.text =
                                                  DateFormat.yMMMd()
                                                      .format(val);
                                            },
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime: DateTime.now(),
                                            use24hFormat: true,
                                          ),
                                        ),
                                      );
                                    },
                                    onSubmit: (value) {},
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "date must be picked";
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20,
                      )
                      .closed
                      .then((_) {
                    cubit.changeButtomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                }
              },
              child: cubit.buttonIcon),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.teal,
              currentIndex: AppCubit.get(context).pageIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Tasks"),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: "Archived"),
              ]),
          body: cubit.tasks.isNotEmpty ||
                  cubit.doneTasks.isNotEmpty ||
                  cubit.archivedTasks.isNotEmpty
              ? cubit.screens[cubit.pageIndex]
              // ignore: dead_code
              : Center(
                  child: CupertinoActivityIndicator(
                      radius: 20.0, color: CupertinoColors.activeBlue),
                ),
        );
      }),
    );
  }
}

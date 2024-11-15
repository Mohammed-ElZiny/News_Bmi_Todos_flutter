import 'package:bmi/modules/todo_module/archived_tasks/archived_tasks_screen.dart';
import 'package:bmi/modules/todo_module/done_tasks/done_tasks_screen.dart';
import 'package:bmi/modules/todo_module/new_tasks/new_tasks_screen.dart';
import 'package:bmi/shared/cubit/todo_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int pageIndex = 0;
  Database? database;
  List<Map> tasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  bool isBottomSheetShown = false;
  Icon buttonIcon = Icon(Icons.edit);

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];

  List<String> titles = ["new tasks", "done tasks", "archived tasks"];

  void changeIndex(int index) {
    pageIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase() {
    openDatabase("todo.db", version: 1, onCreate: (db, version) async {
      print("Database created");
      await db
          .execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,  status TEXT  )")
          .then((value) {
        print("tables has been created");
      }).catchError((er) {
        print("error while creating db: $er");
      });
    }, onOpen: (db) {
      print("database opened $db");
    }).then((value) {
      database = value;
      getDataFromDatabase(database);
      emit(AppCreateDatabaseState());
    });

    // var value = await getDataFromDatabase(database);

    // setState(() {
    //   tasks = value;
    // });
  }

  void insertToDatabse(
      {required Database database,
      required title,
      required time,
      required date}) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
              "INSERT INTO tasks(title, date, time, status) VALUES('$title','$date','$time','on going')")
          .then((id) {
        print('inserted: $id');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database).then((value) {
          tasks = value;
        });
      }).catchError((error) {
        return error;
      });
    });
  }

  getDataFromDatabase(data) async {
    tasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppLoadingDatabaseState());

    await data.rawQuery("SELECT * FROM tasks").then((value) {
      if (value.isNotEmpty) {
        value.forEach((element) {
          String status = element['status'];
          print(status);
          if (status == "on going") {
            tasks.add(element);
          } else if (status == "done") {
            doneTasks.add(element);
          } else {
            archivedTasks.add(element);
          }
        });
      }
    });

    emit(AppGetDatabaseState());
  }

  Future<int> updateData({
    required id,
    required status,
  }) async {
    return await database!.rawUpdate("UPDATE tasks SET status = ? WHERE id = ?",
        ["$status", id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
      return value;
    });
  }

  void deleteData(int id) async{
    await database!.rawDelete("DELETE FROM tasks WHERE id = ?",[id]);
    getDataFromDatabase(database);
    emit(AppDeleteDatabaseState());

  }

  void changeButtomSheetState({required bool isShow, required IconData icon}) {
    isBottomSheetShown = isShow;
    buttonIcon = Icon(icon);
    emit(AppChangeButtomSheetState());
  }
}

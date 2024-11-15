// ignore_for_file: unused_import

import 'package:bmi/layout/todo_app/layout.dart';
import 'package:bmi/modules/bmi_module/bmi/bmi_screen.dart';
import 'package:bmi/modules/counter_module/counter.dart';
import 'package:bmi/modules/login_module/login/login.dart';
import 'package:bmi/shared/bloc_observer.dart';
import 'package:bmi/shared/cubit/news_cubit/cubit.dart';
import 'package:bmi/shared/cubit/news_cubit/states.dart';
import 'package:bmi/shared/cubit/todo_cubit/cubit.dart';
import 'package:bmi/shared/network/local/cash_helper.dart';
import 'package:bmi/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/layout.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Bloc.observer = MyBlocObserver();
    return MultiBlocProvider(
      providers: [
          BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessArticels(),
          ),
      ],
     child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: CashHelper.getData(key: "isDark")
                ? ThemeMode.dark
                : ThemeMode.light,
            //dark theme
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              // scaffoldBackgroundColor: HexColor(),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("333739"),
                  statusBarIconBrightness: Brightness.light,
                ),
                color: HexColor('333739'),
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "San Serif",
                ),
                iconTheme: IconThemeData(
                  color: Colors.deepOrange,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor("333739"),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 50,
              ),
              scaffoldBackgroundColor: HexColor("333739"),
              textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  titleMedium: TextStyle(color: Colors.white, fontSize: 18),
                  bodySmall: TextStyle(color: Colors.grey, fontSize: 12)),
            ),

            //default theme
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              // scaffoldBackgroundColor: HexColor(),
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "San Serif",
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 50,
              ),
              textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  titleMedium: TextStyle(color: Colors.black, fontSize: 18),
                  bodySmall: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

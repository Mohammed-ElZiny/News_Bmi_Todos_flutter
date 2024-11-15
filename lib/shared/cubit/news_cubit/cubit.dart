import 'package:bmi/modules/news_module/business/business_screen.dart';
import 'package:bmi/modules/news_module/science/science_screen.dart';
import 'package:bmi/modules/news_module/search/search_screen.dart';
import 'package:bmi/modules/news_module/sports/sports_screen.dart';
import 'package:bmi/shared/components/consts.dart';
import 'package:bmi/shared/cubit/news_cubit/states.dart';
import 'package:bmi/shared/network/local/cash_helper.dart';
import 'package:bmi/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsCubit extends Cubit<NewsState>{
  // NewsCubit(super.initialState);

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),
    label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports),
    label:"Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science),
    label:"Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings),
    label:"Settings"),
  ];

  void changeBottomNavBar(index){
    currentIndex = index;

    if(index==0){getBusinessArticels();}
    if(index==1){getSportsArticels();}
    if(index==2){getScienceArticels();}

    emit(NewsBottomNav());
  }


   List<Widget> screens = [
        BusinessScreen(),
        SportsScreen(),
        ScienceScreen(),
        SearchScreen(),
    ];


    List business  = [];
    List sports  = [];
    List science  = [];

    getBusinessArticels(){

      if(business.isEmpty){
        emit(NewsGetBusinessLoadingState());
       DioHelper.getData(url: method, query: {
            "locale":"eg",
            "category":"business",
            "api_token":apiToken,
          }).then((value){
            // print(value.data["data"][0]["title"]);
            business = value.data["data"];
            print(business[0]['title']);
          }).catchError((error){
            print(error);
            emit(NewsGetBusinessErrorState(error.toString()));
          });
          emit(NewsGetBusinessSuccessState());
      }

    }

    getSportsArticels(){
      if(sports.isEmpty){
        emit(NewsGetSportsLoadingState());
       DioHelper.getData(url: method, query: {
            "locale":"eg",
            "category":"sports",
            "api_token":apiToken,
          }).then((value){
            sports = value.data["data"];
            // print(value.data["data"][0]["title"]);
          }).catchError((error){
            print(error);
            emit(NewsGetSportsErrorState(error.toString()));
          });
      }
                  emit(NewsGetSportsSuccessState());

      
    }

    getScienceArticels(){
      if(science.isEmpty){
        emit(NewsGetScienceLoadingState());
       DioHelper.getData(url: method, query: {
            "locale":"eg",
            "category":"sciences",
            "api_token":apiToken,
          }).then((value){
            // print(value.data["data"][0]["title"]);
            science = value.data["data"];
            print(business[0]['title']);
          }).catchError((error){
            print(error);
            emit(NewsGetScienceErrorState(error.toString()));
          });
      }
                  emit(NewsGetScienceSuccessState()); 
    }



    bool isDark = false;


    void changeThemeMode(){
      isDark = !isDark;
      CashHelper.putData(key: "isDark",value: isDark);
      emit(NewsChangeThemeState());
    }


    List search = [];
    searchArticles(String value){
      search = [];

      emit(NewsGetSearchLoadingState());
       DioHelper.getData(url: method, query: {
            "q":value,
            "api_token":apiToken,
          }).then((value){
            // print(value.toString());
            // print(value.data["data"][0]["title"]);
            search = value.data["data"];
            for(var articel in search){
              print('-----------------------------------\n');
              print("title: ${articel['title']}");
              print("description: ${articel['description']}");
              print("image: ${articel['image_url']}");
              
            }
                 emit(NewsGetSearchSuccessState());

          }).catchError((error){
            print(error);
            emit(NewsGetSearchErrorState(error.toString()));
          });


     
    //  emit(NewsGetSearchLoadingState());
    //  emit(NewsGetSearchErrorState());

    
}
}

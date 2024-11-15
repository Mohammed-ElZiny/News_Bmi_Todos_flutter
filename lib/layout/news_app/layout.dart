import 'package:bmi/shared/cubit/news_cubit/cubit.dart';
import 'package:bmi/shared/cubit/news_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        builder: (context,state){

          var cubit = NewsCubit.get(context);
          return Scaffold(
      appBar: AppBar(

        title: Text("News"),
        actions: [
          IconButton(onPressed: (){
           cubit.changeBottomNavBar(3);
        }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
            cubit.changeThemeMode();
        }, icon: Icon(Icons.brightness_4_outlined)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        items:cubit.bottomItems,
        onTap: (index){cubit.changeBottomNavBar(index);}, ),

        
    body: cubit.screens[cubit.currentIndex],
    );
        },
         listener: (context,state){

          if(state is NewsBottomNav){
            NewsCubit.get(context).getBusinessArticels();
          }
         });
    
   
    
  }
}
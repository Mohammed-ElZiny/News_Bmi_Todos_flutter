import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/news_cubit/cubit.dart';
import 'package:bmi/shared/cubit/news_cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(
        builder: (context, state) {

          return ConditionalBuilder(
            condition:  NewsCubit.get(context).sports.isNotEmpty     ,
             builder:(context)=>ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>articelBuilder(NewsCubit.get(context).sports[index],context),
                itemCount: NewsCubit.get(context).sports.length,
              ),
              fallback:(context)=> Center(
                  child: CupertinoActivityIndicator(
                      radius: 20.0, color: CupertinoColors.activeBlue),
                ));
              
        },
        listener: (context, state) {});

    //  ?ArticelBuilder():Center(
    //               child: CupertinoActivityIndicator(
    //                   radius: 20.0, color: CupertinoColors.activeBlue),
    //             );
  }
}

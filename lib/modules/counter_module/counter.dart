import 'package:bmi/modules/counter_module/cubit/cubit.dart';
import 'package:bmi/modules/counter_module/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int myCounter = 0;


//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//   }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,counterStat>(
        listener:(context, state){} ,
        builder:(context, state){
          return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
              child: Container(
            child: Row(
              children: [
                TextButton(onPressed: () {
                   CounterCubit.get(context).minus();
                }, child: Text("Minus")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${ CounterCubit.get(context).counter}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                TextButton(onPressed: () {
                  CounterCubit.get(context).plus();
                }, child: Text("Plus")),
              ],
            ),
          )),
        );
        } ,
        
         
      ),
    );
  }
}
    
// }
// class Counter extends StatelessWidget {
//   const Counter
// ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(child: Container(
//         child: Row(
//           children: [
//             TextButton(onPressed: (){}, child: Text("minus")),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text("2",style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w900,
//               ),),
//             )

//           ],
//         ),
//       )),

//     );
//   }
// }

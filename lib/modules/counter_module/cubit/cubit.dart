import 'package:bloc/bloc.dart';
import 'package:bmi/modules/counter_module/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<counterStat> {
  CounterCubit() : super(initialCounterStat());
static CounterCubit get(context)=> BlocProvider.of(context);

int counter  =1 ;
  void minus(){
    counter--;
    emit(minusCounterStat(counter));
  }
  void plus(){
    counter++;
    emit(plusCounterStat(counter));
  }
}
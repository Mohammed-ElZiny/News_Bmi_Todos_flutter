
import 'package:flutter/material.dart';
import 'package:bmi/shared/styles/styles.dart';


class BmiResultScreen extends StatelessWidget {
   const BmiResultScreen({super.key, required this.gender,required this.age, required this.result});
 final bool gender;
final int result;
final int age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title:const Text("BMI Result"),


),
body: Container(
  width: double.infinity,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Gender: ${gender?"Male":"Female"}', style: font3,),
      Text("Result: $result",style: font3,),
      Text("Age: $age",style: font3,),
    ],
  ),  
),
    );
  }
}
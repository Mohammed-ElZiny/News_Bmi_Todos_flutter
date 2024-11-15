import 'dart:math';

import 'package:bmi/modules/bmi_module/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi/shared/styles/styles.dart';
import 'package:bmi/shared/styles/colors.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  int height  = 80;
  int weight  = 80;
  int age  = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(!isMale){
                          isMale= !isMale;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? color2 : color1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 60,
                          ),
                          Text(
                            "Male",
                            style: font1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isMale == true) {
                          isMale = false;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? color1 : color2,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 60,
                          ),
                          Text(
                            "Female",
                            style: font1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(  
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: font1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: font2,
                      ),
                      Text("cm"),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 80,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          height = value.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("AGE", style: font1),
                        Text("${age}", style: font2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {setState(() {
                                age--;
                              });},
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("WEIGHT", style: font1),
                        Text("${weight}", style: font2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "remove- ",

                              onPressed: () {setState(() {
                                weight--;
                              });},
                              child: Icon(Icons.remove),
                              mini: true,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            FloatingActionButton(
                              heroTag: "add+",
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: color2,
            
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height/100,2);
                print(result.round());

                Navigator.push(context,MaterialPageRoute(builder: (context)=>BmiResultScreen( gender: isMale,result: result.toInt(), age: age,)) );
              },
              child: Text("Calculate", style: TextStyle(
                color: Colors.white,
              ),),
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}

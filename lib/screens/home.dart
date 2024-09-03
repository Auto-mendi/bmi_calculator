import 'dart:ui';

import 'package:bmi_calculator/constant/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              color: Color.fromARGB(255, 253, 252, 252),
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color.fromARGB(221, 14, 13, 13),
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w300,
                            color: Colors.white))),
              ),
              Container(
                width: 130,
                child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w300,
                            color: Colors.white))),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: const Text(
              "Calculate",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = _w / (_h * _h);
                if (_bmiResult > 25) {
                  _textResult = "You are over weight";
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You have normal weight";
                } else {
                  _textResult = "You are under weight";
                }
              });
            },
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: const Text(
              "Normal weight",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ])));
  }
}

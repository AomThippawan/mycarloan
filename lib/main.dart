// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();

  double carprice = 0;
  double down = 0;
  double year = 0;
  double interest = 0;
  double finance = 0;
  double interestperyear = 0;
  double totalinterest = 0;
  double totalinterestandfinance = 0;
  double paypermonth = 0;

  void calculation() {
    finance =
        (double.parse(_controller1.text) - double.parse(_controller2.text));
    interestperyear = finance * (double.parse(_controller4.text) / 100);
    totalinterest = interestperyear * (double.parse(_controller3.text));
    totalinterestandfinance = finance + totalinterest;

    setState(() {
      paypermonth =
          totalinterestandfinance / ((double.parse(_controller3.text)) * 12);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.view_headline_rounded,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Align(
              alignment: Alignment.center, //จัดตำแหน่ง
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Car Loan",
                    style: GoogleFonts.robotoMono(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "THIPPAWAN CHAIJAK",
                    style: GoogleFonts.robotoMono(
                        fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            height: 120,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              children: [
                InputForm("ราคารถ", _controller1, "เช่น 800000"),
                InputForm("เงินดาวน์", _controller2, "เช่น 100000"),
                InputForm("จำนวนปีที่ผ่อน", _controller3, "เช่น 4"),
                InputForm("ดอกเบี้ย % ต่อปี", _controller4, "เช่น 5"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              calculation();
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "คำนวณ",
                  style:
                      GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  ดอกเบี้ยต่อปี : " + interestperyear.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 20),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "  รวมดอกเบี้ยทั้งหมด : " + totalinterest.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 20),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "  ผ่อนเดือนละ : " + paypermonth.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget InputForm(
      String title, TextEditingController controller, String hinttext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 15),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}

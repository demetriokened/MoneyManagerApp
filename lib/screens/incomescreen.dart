import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:moneymanagerapp/controllerandmodels/TransactionController.dart';
import 'package:moneymanagerapp/home.dart';
import 'package:moneymanagerapp/screens/HomeScreen.dart';

class IncomeScreen extends StatelessWidget {
  IncomeScreen({super.key});
  TransactionController controller = Get.find();
  TextEditingController Amount = TextEditingController();
  TextEditingController PaidBy = TextEditingController();
  TextEditingController Note = TextEditingController();
  String Date =
      '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: incomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: TextField(
                controller: Amount,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                autofocus: true,
                cursorColor: Colors.grey,
                cursorRadius: Radius.circular(40),
                enableInteractiveSelection: true,
                maxLines: 1,
                style: TextStyle(
                    color: Color.fromARGB(255, 222, 255, 223),
                    fontSize: 72,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '100',
                    hintStyle: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 47, 47, 47))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 60, right: 40),
              child: TextField(
                controller: PaidBy,
                textAlign: TextAlign.center,
                cursorColor: Colors.green,
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 26),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person_circle_fill,
                      color: Colors.greenAccent,
                    ),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2)),
                    label: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Recebeu de'),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.greenAccent, fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 2)),
                    hintText: 'Fulano',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 34, 34, 34),
                        fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 30, right: 40),
              child: TextField(
                controller: Note,
                maxLines: null,
                textAlign: TextAlign.center,
                cursorColor: Colors.grey,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.pen,
                      color: Colors.grey,
                    ),
                    enabled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    label: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text('Nota'),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                    hintText: 'Trabalho...',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 34, 34, 34),
                        fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white, width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 80),
              child: GestureDetector(
                onTap: () {
                  controller.addTransaction(
                      PaidBy.text,
                      double.parse(Amount.text),
                      Note.text,
                      Date,
                      controller.Timefull,
                      true);
                  Get.offAll(() => Home(),
                      transition: Transition.leftToRightWithFade);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Adicionar na carteira',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar incomeAppBar() {
    return AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 17, 17, 17),
        title: Text(
          'Nova Entrada',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 32, 32, 32))),
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.grey,
            )));
  }
}
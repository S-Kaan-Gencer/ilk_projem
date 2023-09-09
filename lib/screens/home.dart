import 'package:evcil_hayvan_sahiplendirme/constans/color.dart';
import 'package:evcil_hayvan_sahiplendirme/constans/taskType.dart';
import 'package:evcil_hayvan_sahiplendirme/model/task.dart';
import 'package:evcil_hayvan_sahiplendirme/sahiplenecek.dart';
import 'package:evcil_hayvan_sahiplendirme/screens/yeniHayvan.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> todo = ["KÖPEK", "KEDİ", "DİĞER"];
  List<Task> todo = [
    Task(
      type: taskType.kopek,
      title: "KÖPEK",
      description: "YUVA ARIYOR",
      isCompleted: false,
    ),
    Task(
      type: taskType.kedi,
      title: "KEDİ",
      description: "YUVA ARIYOR",
      isCompleted: false,
    ),
    Task(
      type: taskType.diger,
      title: "DİĞER",
      description: "YUVA ARIYOR",
      isCompleted: false,
    )
  ];


  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidht = MediaQuery.of(context).size.width;

    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            Container(
              width: deviceWidht,
              height: deviceHeight / 2,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/tattooo.jpeg"),
                      fit: BoxFit.cover)),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Evcil Hayvan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Listesi",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return sahiplenecek(
                        task: todo[index],
                      );
                    },
                  )
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  yeniHayvanScreen(
                   addNewTask: (newTask) {setState(() {
                     todo.add(newTask);
                   });}
                  ),

                ));
              },
              child: const Text("YENİ HAYVAN EKLE"),
            ),
          ],
        ),
      ),
    ));
  }
}

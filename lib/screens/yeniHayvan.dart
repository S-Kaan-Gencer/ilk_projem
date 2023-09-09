import 'package:evcil_hayvan_sahiplendirme/constans/color.dart';
import 'package:evcil_hayvan_sahiplendirme/constans/taskType.dart';
import 'package:evcil_hayvan_sahiplendirme/model/task.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class yeniHayvanScreen extends StatefulWidget {
  const yeniHayvanScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<yeniHayvanScreen> createState() => _yeniHayvanScreenState();
}

class _yeniHayvanScreenState extends State<yeniHayvanScreen> {
  TextEditingController isimController = TextEditingController();
  TextEditingController IrkController = TextEditingController();
  TextEditingController CinsiyetController = TextEditingController();
  TextEditingController OzelliklerController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidht = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        appBar: AppBar(
          title: const Text(
            "MERHABA",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidht,
                height: deviceHeight / 8,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("lib/assets/images/Unknown.jpeg"),
                        fit: BoxFit.cover
                        ),
                        ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text("İSİM"),
                  ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  controller: isimController,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Kategori"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori Seçildi"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/dog kopyası.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori Seçildi"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/cat.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori Seçildi"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/duck.png"),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("IRK"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: IrkController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("CİNSİYET"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: CinsiyetController,
                            decoration: const InputDecoration(
                                filled: true, fillColor: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20), child: Text("Ozellikler")),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: OzelliklerController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                    Task newTask = Task(
                    type: taskType.kopek,
                    title: isimController.text,
                    description: OzelliklerController.text,
                    isCompleted: false,
                  );
                  widget.addNewTask(newTask);
                  Navigator.pop(context);
                },
                child: const Text("EKLE"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

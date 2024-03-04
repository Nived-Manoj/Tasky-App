import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class CreateTask extends StatefulWidget {
  CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String dropdownValue = 'work';
  var items = [
    'work',
    'project',
    'freelancer',
  ];
  List<String> _category = ['Work', 'Project', 'Freelance', 'Other'];
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 390,
                child: Row(
                  children: [
                    Image.asset(
                      color: ColorConstant.Black,
                      'assets/icons/shapes.png',
                      scale: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        hint: Text('Project category'),
                        value: _selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        items: _category.map((Category) {
                          return DropdownMenuItem(
                            child: new Text(Category),
                            value: Category,
                          );
                        }).toList(),
                        icon: ImageIcon(
                          AssetImage('assets/icons/arrow_down.png'),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Project Name")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Description")),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Start Date")),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "End Date")),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    fixedSize: MaterialStatePropertyAll(Size(380, 50))),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => HomeScreen(),
                  //     ));
                },
                child: Text("Save",
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorConstant.white,
                        fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}

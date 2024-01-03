import 'package:flutter/material.dart';
import 'package:mainproject_tasky/view/create_task.dart';
import 'package:mainproject_tasky/view/home_screen.dart';
import 'package:mainproject_tasky/view/search_screen.dart';

import '../utils/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;
  List<Widget> WidgetList = [
    Home(),
    CreateTask(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.Black,
      body: WidgetList[SelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: ColorConstant.primaryBlue,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          SelectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/Group (1).png'),
                size: 30,
              ),
              label: "   Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/Group (1).png"),
                size: 30,
              ),
              label: "Create"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/Group (1).png'),
                size: 30,
              ),
              label: "Search"),
        ],
      ),
    );
  }
}

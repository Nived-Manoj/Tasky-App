// import 'package:flutter/material.dart';
// import 'package:mainproject_tasky/utils/color_constant.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: Image.asset(
//             'assets/icons/Group (1).png',
//           ),
//           onTap: () {},
//         ),
//         actions: [
//           InkWell(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 5, bottom: 5),
//               child: CircleAvatar(
//                 backgroundColor: ColorConstant.Black,
//                 radius: 25,
//               ),
//             ),
//             onTap: () {},
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../utils/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;
  List<Widget> WidgetList = [
    HomeScreen(),
    // HomeScreen(),
    // HomeScreen(),
    // HomeScreen(),
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
                AssetImage("assets/icons/Group (1).png"),
                size: 30,
              ),
              label: "   Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 38,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 38,
              ),
              label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 38,
              ),
              label: "Video"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 38,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';
import 'package:mainproject_tasky/view/profile.dart';
import 'package:mainproject_tasky/view/settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.mainbg,
      appBar: AppBar(
        backgroundColor: ColorConstant.mainbg,
        leading: InkWell(
          child: Image.asset(
            color: ColorConstant.Black,
            'assets/icons/Group (1).png',
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ));
          },
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              child: CircleAvatar(
                backgroundColor: ColorConstant.Black,
                radius: 25,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text("Hello, User!",
                style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 240),
            child: Text("Have a nice day ,",
                style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 18,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorConstant.grey),
                    ),
                    child: Center(
                      child: Text("My Tasks",
                          style: TextStyle(
                            color: ColorConstant.Black,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorConstant.grey),
                    ),
                    child: Center(
                      child: Text("Ongoing",
                          style: TextStyle(
                            color: ColorConstant.Black,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Container(
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorConstant.grey),
                    ),
                    child: Center(
                      child: Text("Completed",
                          style: TextStyle(
                            color: ColorConstant.Black,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

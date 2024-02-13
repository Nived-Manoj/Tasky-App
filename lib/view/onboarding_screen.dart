import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';
import 'package:mainproject_tasky/view/login_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/student1.png"),
          Center(
            child: Text("Manage your daily activity \n team with tasky",
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
          Center(
            child: Text(
              "Manage your daily activity \n team with tasky",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  fixedSize: MaterialStatePropertyAll(Size(160, 60))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 18,
                    color: ColorConstant.white,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';
import 'package:mainproject_tasky/view/bottom_nav.dart';
import 'package:mainproject_tasky/view/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login to your account !",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "username",
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "password",
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  fixedSize: MaterialStatePropertyAll(Size(180, 50))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Text("Login",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorConstant.white,
                      fontWeight: FontWeight.bold))),
          TextButton(onPressed: () {}, child: Text("Forgot Password ?")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegScreen(),
                        ));
                  },
                  child: Text("Sign Up")),
            ],
          )
        ],
      ),
    );
  }
}

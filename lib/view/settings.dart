import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstant.white,
              border: Border.all()),
          width: 400,
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                height: 80,
                width: 380,
                color: ColorConstant.orange,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 35,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Shane Whatson"),
                          Text("Flutter Developer"),
                        ],
                      ),
                      Text("arrow"),
                    ]),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 75,
                width: 380,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logo"),
                        Text(
                          "Account Settings",
                          style: TextStyle(
                              color: ColorConstant.Black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("arrow"),
                      ]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 75,
                width: 380,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logo"),
                        Text(
                          "Privacy",
                          style: TextStyle(
                              color: ColorConstant.Black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("arrow"),
                      ]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 75,
                width: 380,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logo"),
                        Text(
                          "Reset Password",
                          style: TextStyle(
                              color: ColorConstant.Black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("arrow"),
                      ]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 75,
                width: 380,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logo"),
                        Text(
                          "Language",
                          style: TextStyle(
                              color: ColorConstant.Black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("arrow"),
                      ]),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 75,
                width: 380,
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logo"),
                        Text(
                          "Help",
                          style: TextStyle(
                              color: ColorConstant.Black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("arrow"),
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

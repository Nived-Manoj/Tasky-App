import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';
import 'package:mainproject_tasky/view/profile.dart';
import 'package:mainproject_tasky/view/settings.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstant.primaryRed,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Project 1",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 30,
                        )),
                    Text("App developement",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 20,
                        )),
                    Text("21 January 2024",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstant.primaryBlue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Project 2",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 30,
                        )),
                    Text("App design",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 20,
                        )),
                    Text("21 february 2024",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 15,
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("Progress",
                    style: TextStyle(
                      color: ColorConstant.Black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("See All",
                    style: TextStyle(
                      color: ColorConstant.Black,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 390,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstant.mainbg,
              border: Border.all(
                color: ColorConstant.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("App developement",
                        style: TextStyle(
                            color: ColorConstant.Black,
                            fontSize: 27,
                            fontWeight: FontWeight.w500)),
                    Text("Team Project",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 20,
                        )),
                    Text("5 Participants",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 18,
                        )),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.4,
                  center: Text(
                    "40%",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: ColorConstant.primaryRed,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 390,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstant.mainbg,
              border: Border.all(
                color: ColorConstant.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("App developement",
                        style: TextStyle(
                            color: ColorConstant.Black,
                            fontSize: 27,
                            fontWeight: FontWeight.w500)),
                    Text("Team Project",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 20,
                        )),
                    Text("5 Participants",
                        style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 18,
                        )),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 40.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.7,
                  center: Text(
                    "70%",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: ColorConstant.primaryBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';
import 'package:mainproject_tasky/view/profile.dart';
import 'package:mainproject_tasky/view/settings.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: ColorConstant.Black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ));
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 20,
                child: Icon(Icons.person, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, User!",
                style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Have a nice day,",
                style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton("My Tasks"),
                  _buildCategoryButton("Ongoing"),
                  _buildCategoryButton("Completed"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProjectCard("Project 1", "App development",
                      "21 January 2024", ColorConstant.primaryRed),
                  _buildProjectCard("Project 2", "App design",
                      "21 February 2024", ColorConstant.primaryBlue),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Progress",
                      style: TextStyle(
                          color: ColorConstant.Black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
                  Text("See All",
                      style:
                          TextStyle(color: ColorConstant.Black, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              _buildProgressCard("App development", "Team Project",
                  "5 Participants", 0.4, ColorConstant.primaryRed),
              const SizedBox(height: 16),
              _buildProgressCard("App design", "Team Project", "5 Participants",
                  0.7, ColorConstant.primaryBlue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorConstant.Black,
        backgroundColor: ColorConstant.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: ColorConstant.grey),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(title, style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildProjectCard(
      String title, String subtitle, String date, Color color) {
    return Container(
      height: 180,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    color: ColorConstant.Black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            Text(subtitle,
                style: TextStyle(color: ColorConstant.Black, fontSize: 18)),
            Text(date,
                style: TextStyle(color: ColorConstant.Black, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(String title, String subtitle, String participants,
      double progress, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstant.mainbg,
        border: Border.all(color: ColorConstant.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: ColorConstant.Black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(color: ColorConstant.Black, fontSize: 16)),
              const SizedBox(height: 4),
              Text(participants,
                  style: TextStyle(color: ColorConstant.Black, fontSize: 14)),
            ],
          ),
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 10.0,
            animation: true,
            percent: progress,
            center: Text("${(progress * 100).toInt()}%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: color,
          ),
        ],
      ),
    );
  }
}

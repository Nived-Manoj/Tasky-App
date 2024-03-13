import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
            ),
          ),
          Text("Shane Whatson",
              style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 8,
          ),
          Text("Personal info"),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 65,
            width: 400,
            color: Colors.amber,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 65,
            width: 400,
            color: Colors.amber,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 65,
            width: 400,
            color: Colors.amber,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 65,
            width: 400,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}

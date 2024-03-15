import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My profile",
            style: TextStyle(
                color: ColorConstant.Black, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
            ),
          ),
          Text("Shane Watson",
              style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)),
          Text("Flutter Developer",
              style: TextStyle(
                  color: ColorConstant.Black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 8,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text(
                "Personal info",
                style: TextStyle(
                    color: ColorConstant.Black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            width: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 75,
                  width: 380,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email"),
                          Text(
                            "shanewatson@gmail.com",
                            style: TextStyle(
                                color: ColorConstant.Black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone"),
                          Text(
                            "+14 223 224 553",
                            style: TextStyle(
                                color: ColorConstant.Black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Birthday"),
                          Text(
                            "11/11/1999",
                            style: TextStyle(
                                color: ColorConstant.Black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name"),
                          Text(
                            "Shane whatson",
                            style: TextStyle(
                                color: ColorConstant.Black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name"),
                          Text(
                            "Shane whatson",
                            style: TextStyle(
                                color: ColorConstant.Black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

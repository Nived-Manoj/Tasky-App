import 'package:flutter/material.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(
        //   style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: Text("My profile"),
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
                  fontWeight: FontWeight.w500)),
          Text("shanewatson@gmail.com",
              style: TextStyle(
                color: ColorConstant.Black,
                fontSize: 20,
              )),
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
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey,
            ),
            width: 400,
            child: Column(
              children: [
                Container(
                  height: 65,
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
                  height: 65,
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
                  height: 65,
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
                  height: 65,
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
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

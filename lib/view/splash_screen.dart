// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:mainproject_tasky/utils/color_constant.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 8), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => UserScreen(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstant.Black,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 150,
//               width: 150,
//               child: Image.asset("assets/images/splash.png"),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 70),
//               child: CircularProgressIndicator(
//                 color: Colors.deepPurpleAccent,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

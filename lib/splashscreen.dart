// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:senior_project/main.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     startTime();
//   }

//   startTime() async {
//     var duration = Duration(seconds: 2);
//     return Timer(duration, navigateToDeviceScreen);
//   }

//   //edit this
//   navigateToDeviceScreen() {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => MyHomePage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF4C748B),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "HOMEBREW",
//               style: TextStyle(
//                   fontFamily: "Norwester",
//                   fontWeight: FontWeight.w400,
//                   fontSize: 48,
//                   color: Color(0xFFFFFFFF)),
//             ),
//             Text("Handmade Coffee",
//                 style: TextStyle(
//                     fontFamily: "Kollektif",
//                     fontWeight: FontWeight.w400,
//                     fontSize: 18,
//                     color: Color(0xFFFFFFFF))),
//           ],
//         ),
//       ),
//     );
//   }
// }

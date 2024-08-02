// import 'package:agro_tech/src/constants/constants.dart';
// import 'package:agro_tech/register_page.dart';
// import 'package:agro_tech/src/features/authentication/signup_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key, required this.isFarmer});
//   final bool isFarmer;

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//     double inputBoxWidth = MediaQuery.of(context).size.width * 0.8;

//     return Material(
//       child: Stack(
//         // alignment: Alignment.topCenter,
//         children: [
//           Positioned(
//             bottom: 0,
//             child: Opacity(
//               opacity: 0.9,
//               child: Image.asset(
//                 "assets/login page farmer.png",
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Center(
//               heightFactor: 1.2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 50),
//                   const CircleAvatar(
//                     radius: 48,
//                     backgroundImage: AssetImage("assets/farmer.png"),
//                   ),
//                   const SizedBox(height: 50),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         CustomInputField(
//                           controller: controller.phoneNo,
//                           height: 80,
//                           width: inputBoxWidth,
//                           color: const Color(0xff91AF82),
//                           borderWidth: 2,
//                           prefixIcon: const Icon(
//                             Icons.phone,
//                             color: themeColor1,
//                             size: 32,
//                           ),
//                           hintText: 'Phone No',
//                           // validator: (value) {
//                           //   if (value == null || value.isEmpty) {
//                           //     return 'Please enter an email address';
//                           //   } else if (!RegExp(
//                           //           r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
//                           //       .hasMatch(value)) {
//                           //     return 'Please enter a valid email address';
//                           //   }
//                           //   return null; // Return null if the input is valid
//                           // },
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a phone no';
//                             } else if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$')
//                                 .hasMatch(value)) {
//                               return 'Please enter a valid phone no';
//                             }
//                             return null; // Return null if the input is valid
//                           },
//                         ),
//                         const SizedBox(height: 16),
//                         CustomInputField(
//                           controller: controller.password,
//                           height: 80,
//                           width: inputBoxWidth,
//                           color: const Color(0xff91AF82),
//                           borderWidth: 2,
//                           prefixIcon: const Icon(
//                             Icons.lock,
//                             color: themeColor1,
//                             size: 32,
//                           ),
//                           hintText: 'Password',
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter password';
//                             }
//                             // if (value.length != 10 ) {
//                             //   return 'Invalid mobile number';
//                             // }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 10),
//                         const Align(
//                           alignment: Alignment.centerRight,
//                           child: Padding(
//                             padding: EdgeInsets.only(right: 48.0),
//                             child: Text(
//                               "Forgot password ?",
//                               style: TextStyle(color: Color(0xff91AF82)),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 32),
//                         SizedBox(
//                           width: inputBoxWidth,
//                           height: 50,
//                           child: ElevatedButton(
//                             // onPressed: () {
//                             //   if (_formKey.currentState!.validate()) {
//                             //     Navigator.pushReplacement(context,
//                             //         MaterialPageRoute(builder: (context) {
//                             //       return const Layout();
//                             //     }));
//                             //   }
//                             // },
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xff4A6B3E),
//                               // padding:  EdgeInsets.symmetric(
//                               //     horizontal:_input_box_width*0.4,
//                               //     vertical: 20
//                               // ),
//                               textStyle: const TextStyle(fontSize: 18),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25.0),
//                               ),
//                             ),
//                             child: const Text(
//                               'Log in',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         InkWell(
//                             onTap: () {
//                               Get.to(() => const RegisterPage());
//                             },
//                             child: const Text(
//                               "Don't have an account ?",
//                               style: TextStyle(color: Color(0xff91AF82)),
//                             ))
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

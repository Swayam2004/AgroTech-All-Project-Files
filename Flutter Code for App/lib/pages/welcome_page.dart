import 'package:agro_tech/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    // print(screenWidth);
    // print(screenHeight);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome!",
                style: TextStyle(
                    color: Color(0xff4A6B3E),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage("assets/farmer.png"),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) {
                      //     return const LoginPage(
                      //       isFarmer: true,
                      //     );
                      //   }),
                      // );
                      Get.offAll(() => const RegisterPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff4A6B3E),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      height: 48,
                      child: const Center(
                        child: Text(
                          "Login as farmer",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage("assets/consumer.png")),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) {
                      //     return const LoginPage(
                      //       isFarmer: false,
                      //     );
                      //   }),
                      // );
                      Get.offAll(() => const RegisterPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff4A6B3E),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      height: 48,
                      child: const Center(
                        child: Text(
                          "Login as consumer",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

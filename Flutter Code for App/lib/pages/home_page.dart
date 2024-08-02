import 'package:agro_tech/pages/crop_page.dart';
import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:agro_tech/utilities/repository/authentication_repository/authentication_repository.dart';
import 'package:agro_tech/pages/soil_health_page.dart';
import 'package:agro_tech/pages/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String userName = "user";
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: themeColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 40,
                child: Image.asset("assets/farmer.png"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: const Text('My Account'),
            onTap: () {
              Navigator.pushNamed(context, '/my_account');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            title: const Text('Community'),
            onTap: () {
              Navigator.pushNamed(context, '/community');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Sell Your Crops'),
            onTap: () {
              Navigator.pushNamed(context, '/sell_crops');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              AuthenticationRepository.instance.logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                themeColor, // Start color
                themeColor2, // End color
                themeColor
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Welcome Saraswat",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: themeColor2),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/homepage.png',
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Get.to(() => const WeatherTab());
                  });
                },
                child: _buildSection(
                  title: 'Real Time Weather Updates',
                  imageUrl: 'assets/realtime weather.png',
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Get.to(() => const SoilHealthTab());
                  });
                },
                child: _buildSection(
                  title: 'Soil Health',
                  imageUrl: 'assets/home soil health.png',
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Get.to(() => const CropTab());
                  });
                },
                child: _buildSection(
                  title: 'Crop Advisory',
                  imageUrl: "assets/crop advisory.png",
                ),
              ),

              const SizedBox(height: 16),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Cultivate",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
              //       Text("with Love !",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600)),

              //       Text("Made with with ❤️ by AgroTech"),

              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSection({required String title, String? imageUrl}) {
  return Container(
    padding: const EdgeInsets.all(24.0),
    margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
    decoration: BoxDecoration(
      color: themeColor.withOpacity(0.6),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (imageUrl != null)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.asset(
              imageUrl,
            ),
          ),
      ],
    ),
  );
}

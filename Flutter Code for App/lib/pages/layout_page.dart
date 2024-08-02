import 'package:agro_tech/pages/shop_page.dart';
import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:agro_tech/pages/crop_page.dart';
import 'package:agro_tech/pages/home_page.dart';
import 'package:agro_tech/pages/soil_health_page.dart';
import 'package:agro_tech/pages/weather_page.dart';
import 'package:agro_tech/utilities/location/get_location.dart';
import 'package:agro_tech/utilities/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var currentIndex = 0;

  final List<Widget> _pages = [
    const HomeTab(),
    const WeatherTab(),
    const SoilHealthTab(),
    const CropTab(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: screenHeight * 0.1,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "AgroTech",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                GetAndUpdateLocation(),
              ],
            ),
            backgroundColor: themeColor,
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 32,
            ),
          ),
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
                  Get.to(const SellerPage());
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
          body: _pages[currentIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: const NavigationBarThemeData(
              labelTextStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
            child: NavigationBar(
              backgroundColor: themeColor,
              height: MediaQuery.of(context).size.height * 0.08,
              indicatorColor: Colors.transparent,
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.white,
                  ),
                  label: 'Weather',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.eco_outlined,
                    color: Colors.white,
                  ),
                  label: 'Soil Health',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.call_outlined,
                    color: Colors.white,
                  ),
                  label: 'Crop Advisory',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

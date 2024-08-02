// import 'package:flutter/material.dart';

// class ShopPage extends StatefulWidget {
//   const ShopPage({super.key});

//   @override
//   State<ShopPage> createState() => _ShopPageState();
// }

// class _ShopPageState extends State<ShopPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text(
//           "Hi Shyam!",
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.menu, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.shopping_cart, color: Colors.white),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 16),
//             ScrollableAdWidget(height: 200, ads: ads),
//             const SizedBox(height: 16),
//             const Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Market View",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MarketItem(
//                         image: 'assets/images/mango.jpg',
//                         title: 'Mango',
//                         price: '100/- per kg',
//                       ),
//                       MarketItem(
//                         image: 'assets/images/tomato.jpg',
//                         title: 'Tomato',
//                         price: '150/- per kg',
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       MarketItem(
//                         image: 'assets/images/jackfruit.jpg',
//                         title: 'Jackfruit',
//                         price: '170/- per kg',
//                       ),
//                       MarketItem(
//                         image: 'assets/images/rice.jpg',
//                         title: 'Rice',
//                         price: '30/- per kg',
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 32),
//                   Text(
//                     "Popular Categories",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CategoryItem(
//                         image: 'assets/images/beans.jpg',
//                       ),
//                       CategoryItem(
//                         image: 'assets/images/rice_field.jpg',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MarketItem extends StatelessWidget {
//   final String image;
//   final String title;
//   final String price;

//   const MarketItem({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.green[100],
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           children: [
//             Image.asset(
//               image,
//               height: 80,
//               width: 80,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               price,
//               style: const TextStyle(fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryItem extends StatelessWidget {
//   final String image;

//   const CategoryItem({super.key, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Image.asset(image),
//       ),
//     );
//   }
// }

// class ScrollableAdWidget extends StatefulWidget {
//   final List<Widget> ads;
//   final double height;

//   const ScrollableAdWidget({
//     super.key,
//     required this.ads,
//     this.height = 100.0,
//   });

//   @override
//   State<ScrollableAdWidget> createState() => _ScrollableAdWidgetState();
// }

// class _ScrollableAdWidgetState extends State<ScrollableAdWidget> {
//   PageController? _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.8);
//   }

//   @override
//   void dispose() {
//     _pageController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height,
//       child: PageView.builder(
//         controller: _pageController,
//         itemCount: widget.ads.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: Transform.scale(
//               scale: index == _pageController!.page!
//                   ? 1.0
//                   : 0.9, // Scale down inactive ads
//               child: widget.ads[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// final List<Widget> ads = [
//   Container(
//     padding: const EdgeInsets.all(8),
//     color: Colors.green,
//     child: Row(
//       children: [
//         const Column(
//           children: [
//             Text(
//               "Discount",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "25%",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "All vegetables & Fruits",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//         Image.asset('assets/ads1.png'),
//       ],
//     ),
//   ),
//   Expanded(
//     child: Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.green,
//       child: Row(
//         children: [
//           const Column(
//             children: [
//               Text(
//                 "Discount",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "25%",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "All vegetables & Fruits",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//           Image.asset('assets/ads1.png')
//         ],
//       ),
//     ),
//   ),
//   Expanded(
//     child: Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.green,
//       child: Row(
//         children: [
//           const Column(
//             children: [
//               Text(
//                 "Discount",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "25%",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "All vegetables & Fruits",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//           Image.asset('assets/ads1.png')
//         ],
//       ),
//     ),
//   ),
//   Expanded(
//     child: Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.green,
//       child: Row(
//         children: [
//           const Column(
//             children: [
//               Text(
//                 "Discount",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "25%",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 "All vegetables & Fruits",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//           Image.asset('assets/ads1.png')
//         ],
//       ),
//     ),
//   )
// ];

import 'dart:io';
import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SellerPage extends StatefulWidget {
  const SellerPage({super.key});

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
      }
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Sell My Crops',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Outfit',
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.store_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashBoardPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Crop Details',
                  style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: themeColor3,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Crop Name',
                        hintStyle: TextStyle(color: themeColor)),
                  )),
              const SizedBox(height: 10),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: themeColor3,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Quantity',
                        hintStyle: TextStyle(color: themeColor)),
                  )),
              const SizedBox(height: 10),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: themeColor3,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Price per Kg',
                        hintStyle: TextStyle(color: themeColor)),
                  )),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  pickFile();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text('Upload Photos',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
              if (pickedfile != null)
                SizedBox(
                  height: 400,
                  width: 500,
                  child: Image.file(fileToDisplay!),
                ),
              const SizedBox(height: 20),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 100,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: themeColor1, width: 3.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add description...',
                        hintStyle: TextStyle(color: themeColor)),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  double onOfProduct = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   color: Colors.white,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text(
          'My Products',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Outfit',
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      //   body: SingleChildScrollView(
      //     child: Padding(
      //       padding: const EdgeInsets.all(18.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           InkWell(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: Container(
      //               padding: const EdgeInsets.all(10),
      //               width: MediaQuery.of(context).size.width * 0.4,
      //               decoration: BoxDecoration(
      //                 color: themeColor,
      //                 borderRadius: BorderRadius.circular(25.0),
      //               ),
      //               child: const Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Icon(
      //                     Icons.add_circle_outline,
      //                     color: Colors.white,
      //                   ),
      //                   Text(
      //                     'Add Products',
      //                     style: TextStyle(color: Colors.white),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 15,
      //           ),
      //           const StoreItem(
      //             image: 'lib/assets/products/rice.png',
      //             title: "Rice",
      //             price: "40",
      //             quantity: '400',
      //           ),
      //           const StoreItem(
      //             image: 'assets/products/mango.png',
      //             title: "Mango",
      //             price: "50",
      //             quantity: '100',
      //           ),
      //           const StoreItem(
      //             image: 'assets/products/jackfruit.png',
      //             title: "Jackfruit",
      //             price: "10",
      //             quantity: '200',
      //           ),
      //           const StoreItem(
      //             image: 'assets/products/tamato.png',
      //             title: "Tamato",
      //             price: "20",
      //             quantity: '200',
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}

class StoreItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String quantity;

  const StoreItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: themeColor2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 80,
                width: 80,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$quantity kg',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '₨ $price/kg ',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  backgroundColor: themeColor.withOpacity(0.5),
                  radius: 20,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: themeColor,
                    onPressed: () {},
                  ),
                ),
              ))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

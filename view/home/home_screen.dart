import 'package:app/common_widget/section_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/category_cell.dart';
import '../../common_widget/product_cell.dart';
import 'product_details_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtSearch = TextEditingController();

  List exclusiveOfferArr = [
    {
      "name": "Organic Bananas",
      "icon": "assets/img/banana.png",
      "qty": "7",
      "unit": "pcs, Prices",
      "price": "Rs 15"
    },
    {
      "name": "Apples",
      "icon": "assets/img/apple.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 10"
    },
  ];

  List bestSellingArr = [
    {
      "name": "Bell Pepper",
      "icon": "assets/img/bell_pepper_red.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 25"
    },
    {
      "name": "Ginger",
      "icon": "assets/img/ginger.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 15"
    },
  ];

  List groceriesArr = [
    {
      "name": "Pulses",
      "icon": "assets/img/pulses.png",
      "color": const Color(0xffF8A44C),
    },
    {
      "name": "Rice",
      "icon": "assets/img/rice.png",
      "color": const Color(0xff53B175),
    },
  ];
  List listArr = [
    {
      "name": "Beef Bone",
      "icon": "assets/img/beef_bone.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 1500"
    },
    {
      "name": "Chicken",
      "icon": "assets/img/broiler_chicken.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 800"
    },
  ];

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.sizeOf(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       "assets/img/color_logo.png",
//                       width: 25,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset("assets/img/location.png",
//                         width: 16, height: 16),
//                     const SizedBox(width: 8),
//                     Text(
//                       "Islamabad, E-11",
//                       style: TextStyle(
//                         color: TColor.darkGray,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Container(
//                     height: 52,
//                     decoration: BoxDecoration(
//                       color: const Color(0xffF2F3F2),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     alignment: Alignment.center,
//                     child: TextField(
//                       controller: txtSearch,
//                       decoration: InputDecoration(
//                         contentPadding:
//                             const EdgeInsets.symmetric(vertical: 16),
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.all(13),
//                           child: Image.asset(
//                             "assets/img/search.png",
//                             width: 20,
//                             height: 20,
//                           ),
//                         ),
//                         border: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         hintText: "Explore Mart",
//                         hintStyle: TextStyle(
//                             color: TColor.placeholder,
//                             fontSize: 17,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ),
// //BANNER
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Container(
//                     width: double.maxFinite,
//                     height: 115,
//                     decoration: BoxDecoration(
//                       color: const Color(0xffF2F3F2),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       "assets/img/banner_top.png",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),

//                 SectionView(
//                     title: "EXCLUSIVE OFFER",
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 20),
//                     onPressed: () {}),
//                 SizedBox(
//                   height: 230,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       itemCount: exclusiveOfferArr.length,
//                       itemBuilder: (context, index) {
//                         var pObj = exclusiveOfferArr[index] as Map? ?? {};
//                         return ProductCell(
//                           pObj: pObj,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ProductDetailsView(item: pObj)));
//                           },
//                           onCart: () {},
//                         );
//                       }),
//                 ),

//                 SectionView(
//                     title: "Hot Sellers",
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 20),
//                     onPressed: () {}),
//                 SizedBox(
//                   height: 230,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       itemCount: bestSellingArr.length,
//                       itemBuilder: (context, index) {
//                         var pObj = bestSellingArr[index] as Map? ?? {};
//                         return ProductCell(
//                           pObj: pObj,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ProductDetailsView(item: pObj)));
//                           },
//                           onCart: () {},
//                         );
//                       }),
//                 ),
//                 SectionView(
//                     title: "Food & Produce",
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//                     onPressed: () {}),
//                 SizedBox(
//                   height: 100,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       itemCount: groceriesArr.length,
//                       itemBuilder: (context, index) {
//                         var pObj = groceriesArr[index] as Map? ?? {};
//                         return CategoryCell(
//                           pObj: pObj,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         ProductDetailsView(item: pObj)));
//                           },
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 SizedBox(
//                   height: 100,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       itemCount: listArr.length,
//                       itemBuilder: (context, index) {
//                         var pObj = listArr[index] as Map? ?? {};
//                         return CategoryCell(
//                           pObj: pObj,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ProductDetailsView(
//                                           item: pObj,
//                                         )));
//                           },
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    "assets/img/color_logo.png",
                    width: 25,
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/img/location.png",
                          width: 16, height: 16),
                      const SizedBox(width: 8),
                      Text(
                        "Islamabad, E-11",
                        style: TextStyle(
                          color: TColor.darkGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                _buildSearchBar(),
                const SizedBox(height: 15),
                _buildBanner(),
                const SizedBox(height: 15),
                _buildSectionView("EXCLUSIVE OFFER", exclusiveOfferArr),
                const SizedBox(height: 15),
                _buildSectionView("Hot Sellers", bestSellingArr),
                const SizedBox(height: 15),
                _buildSectionView("Food & Produce", groceriesArr),
                const SizedBox(height: 15),
                _buildSectionView("List Items", listArr),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xffF2F3F2),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: txtSearch,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(13),
              child: Image.asset(
                "assets/img/search.png",
                width: 20,
                height: 20,
              ),
            ),
            border: InputBorder.none,
            hintText: "Explore Mart",
            hintStyle: TextStyle(
              color: TColor.placeholder,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.maxFinite,
        height: 115,
        decoration: BoxDecoration(
          color: const Color(0xffF2F3F2),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/img/banner_top.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSectionView(String title, List items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionView(
          title: title,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          onPressed: () {},
        ),
        SizedBox(
          height: 230, // Adjust this height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: items.length,
            itemBuilder: (context, index) {
              var pObj = items[index] as Map? ?? {};
              return ProductCell(
                pObj: pObj,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: pObj),
                    ),
                  );
                },
                onCart: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

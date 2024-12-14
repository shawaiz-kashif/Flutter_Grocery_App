//TAB LIST CREATION SCREEN!!!!!!!!!!!!!!!

import 'package:app/common/color_extension.dart';
import 'package:app/view/Categories/search_screen.dart';
import 'package:app/view/home/home_screen.dart';
import 'package:app/view/my%20acc/account.dart';
import 'package:flutter/material.dart';

import '../Categories/cart_screen.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: [
        // Tabs Function/File getting Called
        const HomeScreen(),
        const SearchScreen(),
        CartScreen(),
        MyAccountTab(),
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 3, offset: Offset(0, -2))
            ]),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              indicatorWeight: 1,
              labelColor: TColor.primary,
              labelStyle: TextStyle(
                color: TColor.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: TColor.primaryText,
              unselectedLabelStyle: TextStyle(
                color: TColor.primaryText,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Tab(
                  text: "Shop",
                  icon: Image.asset(
                    "assets/img/store_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 0 ? TColor.button : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "Search",
                  icon: Image.asset(
                    "assets/img/explore_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 1 ? TColor.button : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "My Cart",
                  icon: Image.asset(
                    "assets/img/cart_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 2 ? TColor.button : TColor.primaryText,
                  ),
                ),
                Tab(
                  text: "Account",
                  icon: Image.asset(
                    "assets/img/account_tab.png",
                    width: 25,
                    height: 25,
                    color: selectTab == 3 ? TColor.button : TColor.primaryText,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

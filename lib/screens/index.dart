import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_go/components/styles/app_style.dart';
import 'package:green_go/core/provider/home_provider.dart';
import 'package:green_go/screens/drawer/app_drawer.dart';
import 'package:green_go/screens/profile/profile_screen.dart';
import 'package:green_go/screens/search/search_screen.dart';
import 'package:green_go/screens/settings/settings_screen.dart';
import 'package:green_go/screens/support/support_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'carts/cart_screen.dart';
import 'category/category_screen.dart';
import 'create/create_product.dart';
import 'favorite/favorite_lists_screen.dart';
import 'home/home_screen.dart';
import 'home/single_home.dart';
import 'home/single_product.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({Key key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Widget> _childrenScreen = [
    HomeScreen(), //0
    CategoryScreen(),
    HomeScreen(),
    FavoriteListScreen(),
    CartScreen(),
    SearchScreen(),
    SingleProductScreen(),
    SingleHomeScreen(),
    CreateProductScreen(),
    FavoriteListScreen(),
    SettingsScreen(),
    SupportScreen(),
    SearchScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvder = Provider.of<HomeProvider>(context);

    log("${homeProvder.getSelectedIndex}");
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: AppStyle.colorGreen,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              }),
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: "GREEN",
              style: TextStyle(
                color: AppStyle.colorGreen,
                fontWeight: FontWeight.bold,
                fontSize: 17.0.sp,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "GO",
                  style: TextStyle(
                    color: AppStyle.colorPurple,
                    fontSize: 17.0.sp,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                homeProvder.setSelectedIndex(6);
              },
            )
          ],
        ),
        body: _childrenScreen[homeProvder.getSelectedIndex],
        drawer: AppDrawerScreen(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          backgroundColor: AppStyle.colorPurple,
          onPressed: () {},
          child: Center(
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: homeProvder.getSelectedIndex <= 4
              ? homeProvder.getSelectedIndex
              : 0,
          selectedItemColor: AppStyle.colorPurple,
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            color: AppStyle.colorPurple,
          ),
          onTap: (final int ind) {
            homeProvder.setSelectedIndex(ind);
          },
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 6.0.h,
                width: 6.0.w,
                child: SvgPicture.asset(
                  'assets/images/svg/home.svg',
                  color: homeProvder.getSelectedIndex <= 4
                      ? homeProvder.getSelectedIndex == 0
                          ? AppStyle.colorPurple
                          : null
                      : AppStyle.colorPurple,
                ),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 6.0.h,
                width: 6.0.w,
                child: SvgPicture.asset(
                  'assets/images/svg/shop.svg',
                  color: homeProvder.getSelectedIndex == 1
                      ? AppStyle.colorPurple
                      : null,
                ),
              ),
              label: 'Категории',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.hourglass_empty,
                color: Colors.transparent,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 6.0.h,
                width: 6.0.w,
                child: SvgPicture.asset(
                  'assets/images/svg/favorite.svg',
                  color: homeProvder.getSelectedIndex == 3
                      ? AppStyle.colorPurple
                      : null,
                ),
              ),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 6.0.h,
                width: 6.0.w,
                child: SvgPicture.asset(
                  'assets/images/svg/card.svg',
                  color: homeProvder.getSelectedIndex == 4
                      ? AppStyle.colorPurple
                      : null,
                ),
              ),
              label: 'Корзина',
            ),
          ],
        ),
      ),
    );
  }
}

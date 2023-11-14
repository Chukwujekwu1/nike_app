import 'package:flutter/material.dart';
import 'package:nike_app/components/bottom_nav_bar.dart';
import 'package:nike_app/pages/cart_page.dart';
import 'package:nike_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the botton navigation bar
  int _selectedIndex = 0;

  // this methos will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),
    // Cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon:const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[700],
        child: Column(
          children: [
            //logo
            DrawerHeader(
              child: Image.asset(
                'lib/images/nikeLogo.jpg',
                fit: BoxFit.cover,
                color: Colors.white,
                
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

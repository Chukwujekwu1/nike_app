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
            icon:const Padding(
              padding:  EdgeInsets.only(left: 12),
              child:  Icon(
                Icons.menu,
                color: Colors.black,
              ),
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
        backgroundColor: const Color.fromARGB(255, 21, 20, 20),
        child: Column(
          children: [
            //logo
            DrawerHeader(
              child: Image.asset(
                'lib/images/nikeLogo.jpg',
                color: Colors.white,
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),
          const  Padding(
              padding: EdgeInsets.all(8.0),
              child:  ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          const  Padding(
              padding: EdgeInsets.all(8.0),
              child:  ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
           const Spacer(),
          const  Padding(
              padding: EdgeInsets.only(bottom: 25),
              child:  ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',  
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wisata_app/app/modules/wisata_category_page/controllers/wisata_page_controller.dart';
import 'package:wisata_app/app/modules/wisata_page/views/wisata_page_view.dart';




import '../../dashboard/views/dashboard_view.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  int _currentIndex = 0;

  final List<Widget> _pages = [
   DashboardView(),
   const WisataPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,  size: 20) ,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_rounded,  size: 20,),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_rounded,  size: 20),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 20,),
            label: 'Search',
          ),
       
        ],
      ),
    );
  }
}
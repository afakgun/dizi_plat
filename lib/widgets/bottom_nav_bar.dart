import 'package:dizi_plat/pages/homepage/home_page.dart';
import 'package:dizi_plat/pages/movie/moviepage.dart';
import 'package:dizi_plat/pages/profile/profilepage.dart';
import 'package:dizi_plat/pages/series/seriespage.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;

// void _selectedPage(int index) {
//   setState(() {
//     _selectedIndex = index;
//   });
// }

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final sayfalarr = [
    const HomePage(),
    MoviePage(),
    SeriesPage(),
    const ProfilePage(),
  ];

  late List<Map<String, Object>> _sayfalar;

  int _selectedIndex = 0;

  @override
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
      sayfalarr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfalarr[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: const Color(0xFF17162e),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.tealAccent[700],
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.home_rounded),
              onTap: () {
                _selectedPage;
              },
            ),
            tooltip: 'Ana Sayfa',
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.movie),
              onTap: () {
                _selectedPage;
              },
            ),
            tooltip: 'Filmler',
            label: 'Filmler',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.tv),
              onTap: () {
                _selectedPage;
              },
            ),
            tooltip: 'Profil',
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.person),
              onTap: () {
                _selectedPage;
              },
            ),
            tooltip: 'Diziler',
            label: 'Diziler',
          ),
        ],
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       onTap: _selectedPage,
//       currentIndex: _selectedIndex,
      

//       backgroundColor: const Color(0xFF17162e),
//       unselectedItemColor: Colors.black,
//       selectedItemColor: Colors.black,
//       // ignore: prefer_const_literals_to_create_immutables
//       items: [
//         BottomNavigationBarItem(
//             icon: GestureDetector(
//               child: Icon(Icons.home),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const HomePage()));
//               },
//             ),
//             label: "Ana Sayfa"),
//         BottomNavigationBarItem(
//             icon: GestureDetector(
//               child: Icon(Icons.movie),
//               onTap: () {
//                Get.to(MoviePage());
//               },
//             ),
//             label: "Filmler"),
//         BottomNavigationBarItem(
//             icon: GestureDetector(
//               child: Icon(Icons.tv),
//               onTap: () {
//                 Get.to(SeriesPage());
//               },
//             ),
//             label: "Diziler"),
//         BottomNavigationBarItem(
//             icon: GestureDetector(
//               child: Icon(Icons.person),
//               onTap: () {
//                 Get.to(HomePage());
//               },
//             ),
//             label: "Profile"),
            
//       ],
//     );
    
//   }
// }

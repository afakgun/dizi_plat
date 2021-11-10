import 'package:dizi_plat/pages/homepage/home_page.dart';
import 'package:dizi_plat/pages/movie/moviepage.dart';
import 'package:dizi_plat/pages/profile/profilepage.dart';
import 'package:dizi_plat/pages/series/series_list.dart';
import 'package:dizi_plat/pages/series/seriespage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  //List _sayfalar = [
  //AnaSayfa(),
  //Filmler(),
  //Arama(),
  //Profil(),
  //KullaniciBilgi(),
  //];

  late List<Map<String, Object>> _sayfalar;

  int _selectedIndex = 0;

  @override
  void initState() {
    _sayfalar = [
      {
        'sayfa': const HomePage(),
        'başlık': 'Ana Sayfa',
      },
      {
        'sayfa': MoviePage(),
        'başlık': 'Filmler',
      },
      {
        'sayfa': SeriesPage(),
        'başlık': 'Diziler',
      },
      {
        'sayfa': SeriesList(),
        'başlık': 'Profil',
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _selectedPage,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.blueGrey,
      selectedItemColor: Colors.tealAccent[700],
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            child: const Icon(Icons.home_rounded),
            onTap: () {
              Get.to(() => const HomePage());
            },
          ),
          tooltip: 'Ana Sayfa',
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            child: Icon(Icons.movie),
            onTap: () {
              Get.to(() => MoviePage());
            },
          ),
          tooltip: 'Filmler',
          label: 'Filmler',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            child: const Icon(Icons.tv),
            onTap: () {
              Get.to(() => SeriesPage());
            },
          ),
          tooltip: 'Profil',
          label: 'Profil',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            child: const Icon(Icons.person),
            onTap: () {
              Get.to(() => const ProfilePage());
            },
          ),
          tooltip: 'Diziler',
          label: 'Diziler',
        ),
      ],
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

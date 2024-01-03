import 'package:flutter/material.dart';
import 'package:untitled32/view/bottomNavigationBar.dart';
import 'package:untitled32/view/medicine_screen.dart';

class Classifications extends StatefulWidget {
  const Classifications({Key? key}) : super(key: key);

  @override
  State<Classifications> createState() => _ClassificationsState();
}

class _ClassificationsState extends State<Classifications> {
  int _currentIndex = 0;
  List<Widget> Scaffolds = const [HomeBar(), OrdersScreen(), favorite()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffolds[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xff17A274),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
            label: 'favorite',
          ),
        ],
        // Other properties...
      ),
    );
  }
}





// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       children: [
//         a1Expanded(),
//         const SizedBox(
//           width: 30,
//         ),
//         a2Expanded(),
//       ],
//     ),
//   ),
// ),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       children: [
//         a3Expanded(),
//         const SizedBox(
//           width: 30,
//         ),
//         a4Expanded(),
//       ],
//     ),
//   ),
// ),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       children: [
//         a5Expanded(),
//         const SizedBox(
//           width: 30,
//         ),
//         a6Expanded(),
//       ],
//     ),
//   ),
// ),

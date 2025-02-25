// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Tab Index: $_selectedIndex',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // TODO: Thêm logic quét QR
//         },
//         backgroundColor: Colors.blue,
//         child: Icon(Icons.qr_code_scanner, color: Colors.white),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         child: Container(
//           height: 60,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 5,
//                 spreadRadius: 2,
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.home,
//                     color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
//                 onPressed: () => _onItemTapped(0),
//               ),
//               IconButton(
//                 icon: Icon(Icons.history,
//                     color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
//                 onPressed: () => _onItemTapped(1),
//               ),
//               SizedBox(width: 48), // Khoảng trống cho FAB
//               IconButton(
//                 icon: Icon(Icons.account_circle,
//                     color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
//                 onPressed: () => _onItemTapped(2),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

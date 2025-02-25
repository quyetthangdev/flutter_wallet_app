import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'pages/home_page.dart';
import 'pages/offers_page.dart';
import 'pages/history_page.dart';
import 'pages/profile_page.dart';
import 'pages/qr_scan_page.dart';
import 'utils/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  // Initialize the controller immediately instead of using 'late'
  PageController _pageController = PageController();

  // List of pages to display
  final List<Widget> _pages = [
    HomePage(),
    OffersPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    // Set the initial page after the controller is created
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
      // Animate to the selected page
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use PageView for smooth transitions between pages
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Disable swiping
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(LineIcons.home, "Trang chủ", 0),
              _buildNavItem(LineIcons.gift, "Ưu đãi", 1),
              SizedBox(width: 80),
              _buildNavItem(LineIcons.history, "Lịch sử GD", 2),
              _buildNavItem(LineIcons.user, "Hồ sơ", 3),
            ],
          ),
        ),
      ),

      floatingActionButton: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withAlpha(40),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Navigate to QR scan page with transition
              Navigator.of(context).push(
                PageTransition(
                  type: PageTransitionType.scale,
                  alignment: Alignment.bottomCenter,
                  child: QrScanPage(),
                  duration: Duration(milliseconds: 400),
                ),
              );
            },
            customBorder: CircleBorder(),
            child: Icon(Icons.qr_code_scanner, size: 32, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                _selectedIndex == index
                    ? Colors.deepPurple
                    : Colors.grey.shade800,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color:
                  _selectedIndex == index
                      ? Colors.deepPurple
                      : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

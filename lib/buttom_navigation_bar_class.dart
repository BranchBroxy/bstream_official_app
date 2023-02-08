import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BottomNaviBar extends StatefulWidget {
  @override
  _BottomNaviBarState createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [    HomePage(),    SearchPage(),    ShopPage(),    SettingsPage()  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        itemBuilder: (context, index) => _pages[index],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        controller: PageController(
          initialPage: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'B-Stream',
          style: TextStyle(fontFamily: "DancingScript"),
          //style: GoogleFonts.getFont('Lato'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Official B-Stream Landing App'),
            ElevatedButton(
              onPressed: () => context.push("/Settings"),
              child: const Text("Go to Settings"),
            ),
            Text('Official B-Stream Landing App'),
            ElevatedButton(
              onPressed: () => context.push("/Settings"),
              child: const Text("Go to Settings"),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Search"),
      ),
    );
  }
}

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Shop"),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Settings"),
      ),
    );
  }
}


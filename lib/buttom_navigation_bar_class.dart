import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class fancyNaviBar extends StatefulWidget {
  const fancyNaviBar({Key? key}) : super(key: key);

  @override
  State<fancyNaviBar> createState() => _fancyNaviBarState();
}

class _fancyNaviBarState extends State<fancyNaviBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          padding: EdgeInsets.all(16),
          gap: 8,
          onTabChange: (index){
            print(index);
            switch (index){
              case 0:
                context.push("/Settings");
                break;
              case 1:
                print("case1");
                break;
              case 2:
                print("case2");
                break;
              case 3:
                print("case3");
                break;
            }
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Likes",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}


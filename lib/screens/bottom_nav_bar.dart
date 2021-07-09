import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black,
              offset: Offset(0, -.1),
              spreadRadius: -1,
              blurRadius: 24)
        ]),
        child: BottomNavigationBar(
            selectedItemColor: Color(0xFFD7DDE8),
            unselectedItemColor: Color(0xFFD7DDE8),
            backgroundColor: Color(0xFF252C39),
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Image.asset('assets/home.png', height: 24, width: 24),
              ),
              BottomNavigationBarItem(
                  label: 'Live stream',
                  icon: Image.asset(
                    'assets/stream.png',
                    height: 24,
                    width: 24,
                  )),
              BottomNavigationBarItem(
                  label: 'Live store',
                  icon: Image.asset('assets/store.png', height: 24, width: 24)),
            ]));
  }
}
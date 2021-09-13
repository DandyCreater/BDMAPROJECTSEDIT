import 'package:bdma/scene/dashboard.dart';
import 'package:bdma/scene/profile.dart';
import 'package:bdma/scene/transaksi.dart';
import 'package:flutter/material.dart';

class AppMain extends StatefulWidget {
  const AppMain({Key key}) : super(key: key);

  @override
  _AppMainState createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int _selectedIndex = 0;
  final _layoutPage = [
    Dashboard(),
    Transaksi(),
    Profile(),
  ];
  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFF0730F),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset("assets/icon/beranda_grey.png"),
              activeIcon: Image.asset("assets/icon/beranda_filled.png"),
              title: Text("Beranda")),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icon/transaksi_grey.png"),
              activeIcon: Image.asset("assets/icon/transaksi_filled.png"),
              title: Text("Transaksi")),
          BottomNavigationBarItem(
              activeIcon: Image.asset("assets/icon/profil_filled.png"),
              icon: Image.asset("assets/icon/profil_grey.png"),
              title: Text("Profil")),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}

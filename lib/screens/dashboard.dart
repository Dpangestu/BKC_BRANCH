import 'package:bkc_super_app/screens/pages/activity.dart';
import 'package:bkc_super_app/screens/pages/home.dart';
import 'package:bkc_super_app/screens/pages/logout.dart';
import 'package:bkc_super_app/screens/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentTab = 0;
  final List<Widget> _screens = [Home(), Activity(), Profile(), Logout()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTab],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
        backgroundColor: Color(0xFF225CAB),
        elevation: 6,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(0, FeatherIcons.home, 'Home'),
                  _buildNavItem(1, FeatherIcons.fileText, 'Activity'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(2, FeatherIcons.user, 'Profile'),
                  _buildNavItem(3, FeatherIcons.logOut, 'Logout'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          _currentTab = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _currentTab == index ? Color(0xFF225CAB) : Colors.black,
          ),
          _currentTab == index
              ? Text(
                  label,
                  style: TextStyle(color: Color(0xFF225CAB)),
                )
              : Container(),
        ],
      ),
    );
  }
}

import 'package:blood_donation/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../data_model.dart';
import 'gifts_page.dart';
import 'home_page.dart';
import 'leaderboard_page.dart';
import 'notifications_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("fech tbalbez ti aatina page sahbi");

    switch (currentPageIndex) {
      case 0:
        currentWidgetPage = const HomePage();
        break;
      case 1:
        currentWidgetPage = const LeaderboardPage();
        break;
      case 2:
        currentWidgetPage = const GiftsPage();
        break;
      case 3:
        currentWidgetPage = const NotificationsPage();
        break;
      case 4:
        currentWidgetPage = const ProfilePage();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Bonjour ${currentUser.name}",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        centerTitle: true,
        elevation: 20,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            currentPageIndex = newIndex;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Acceuil"),
          NavigationDestination(
              icon: Icon(Icons.leaderboard), label: "Classement"),
          NavigationDestination(icon: Icon(Icons.redeem), label: "Cadeaux"),
          NavigationDestination(
              icon: Icon(Icons.notifications), label: "Notifications"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      body: currentWidgetPage,
    );
  }
}

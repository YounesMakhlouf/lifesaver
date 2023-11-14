import 'package:blood_donation/datamodel.dart';
import 'package:blood_donation/pages/leadearboardpage.dart';
import 'package:blood_donation/pages/main1page.dart';
import 'package:blood_donation/pages/main2page.dart';
import 'package:blood_donation/pages/main3page.dart';
import 'package:blood_donation/pages/signin.dart';
import 'package:flutter/material.dart';

import 'pages/GiftsPage.dart';
import 'pages/HomePage.dart';
import 'pages/NotificationsPage.dart';
import 'pages/ProfilePage.dart';
import 'pages/loadingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tbara3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: '/loading', // Set the initial route to LoadingPage
      routes: {
        '/loading': (context) => const LoadingPage(),
        '/main1': (context) => const Main1Page(),
        '/main2': (context) => const Main2Page(),
        '/main3': (context) => const Main3Page(),
        '/signin': (context) => const SigninPage(),
        '/myhomepage': (context) => const MyHomePage(),
      },
    );
  }
}

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
        title: Center(
            child: Text("Bonjour ${currentUser.name}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22))),
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

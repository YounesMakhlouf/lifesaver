import 'package:flutter/material.dart';

import 'pages/GiftsPage.dart';
import 'pages/HomePage.dart';
import 'pages/NotificationsPage.dart';
import 'pages/ProfilePage.dart';
import 'pages/SearchPage.dart';

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
      home: const MyHomePage(),
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
        currentWidgetPage = const SearchPage();
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Image.asset("images/blood.png")),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            currentPageIndex = newIndex;
          });
        },
        // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Acceuil"),
          NavigationDestination(icon: Icon(Icons.search), label: "Recherche"),
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

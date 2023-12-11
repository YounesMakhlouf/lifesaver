import 'package:blood_donation/data_model.dart';
import 'package:blood_donation/pages/leaderboard_page.dart';
import 'package:blood_donation/pages/start_pages/start_page1.dart';
import 'package:blood_donation/pages/start_pages/start_page2.dart';
import 'package:blood_donation/pages/start_pages/start_page3.dart';
import 'package:blood_donation/pages/authenticate/sign_in.dart';
import 'package:blood_donation/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages/gifts_page.dart';
import 'pages/home_page.dart';
import 'pages/notifications_page.dart';
import 'pages/profile_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
      title: 'tbara3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: '/main1',
      routes: {
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

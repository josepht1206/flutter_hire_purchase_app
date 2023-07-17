import 'package:flutter/material.dart';
import 'package:hire_purchase/payment.dart';
import 'package:hire_purchase/profile.dart';

import 'home.dart';
import 'notification.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int pageIndex = 0;

  final pages = [HomePage(), const PaymentPage(), const ProfilePage()];

  void onNavigatorTap(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hire Purchase App'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const NotificationPage(),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: pages[pageIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: pageIndex == 0,
              onTap: () {
                onNavigatorTap(0);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Payment'),
              selected: pageIndex == 1,
              onTap: () {
                onNavigatorTap(1);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              selected: pageIndex == 2,
              onTap: () {
                onNavigatorTap(2);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onNavigatorTap,
      ),
    );
  }
}

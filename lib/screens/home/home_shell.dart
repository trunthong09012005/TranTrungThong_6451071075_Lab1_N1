import 'package:flutter/material.dart';
import 'package:lab1_mobile_n2/screens/home/home_screen.dart';
import 'package:lab1_mobile_n2/widgets/main_bottom_nav.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          HomeScreen(),
          _PlaceholderTab(title: 'Search'),
          _PlaceholderTab(title: 'Create'),
          _PlaceholderTab(title: 'Messages'),
          _PlaceholderTab(title: 'Profile'),
        ],
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title — coming soon',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

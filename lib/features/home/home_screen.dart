import 'package:flutter/material.dart';

import '../animals/animal_list_screen.dart';
import '../breeding/breeding_pair_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  static const _screens = [AnimalListScreen(), BreedingPairListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.pets), label: 'Animals'),
          NavigationDestination(
              icon: Icon(Icons.favorite), label: 'Breeding'),
        ],
      ),
    );
  }
}

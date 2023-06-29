import 'package:flutter/material.dart';

class CustomBottomNavigaton extends StatelessWidget {
  const CustomBottomNavigaton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.yard_outlined), label: 'Comics'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_available_outlined), label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.share_outlined), label: 'Series'),
          BottomNavigationBarItem(
              icon: Icon(Icons.storage_outlined), label: 'Stories'),
        ]);
  }
}

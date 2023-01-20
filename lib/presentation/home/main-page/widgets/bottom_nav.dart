import 'package:flutter/material.dart';

ValueNotifier<int> indexedchangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          elevation: 0,
          onTap: ((index) {
            indexedchangeNotifier.value = index;
          }),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.collections_outlined,
              ),
              label: 'New & Hot ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.emoji_emotions,
              ),
              label: 'Fast Laughs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.downloading_outlined,
              ),
              label: 'Downloads',
            ),
          ],
        );
      },
      valueListenable: indexedchangeNotifier,
    );
  }
}

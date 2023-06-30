import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/book_model.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
      Book('Too Like the Lightning', 'Ada Palmer'),
      Book('Kindred', 'Octavia E. Butler'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (var book in books)
                  GestureDetector(
                    onTap: () {
                      context.go('/books/${books.indexOf(book)}');
                      // navigateToDetailPage(context, books, book);
                    },
                    child: ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    ),
                  )
              ],
            ),
          ),
          Expanded(child: child),

          // child,
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'A Screen',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'B Screen',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notification_important_rounded),
      //       label: 'C Screen',
      //     ),
      //   ],
      //   currentIndex: _calculateSelectedIndex(context),
      //   onTap: (int idx) => _onItemTapped(idx, context),
      // ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.endsWith('0')) {
      return 0;
    }
    if (location.startsWith('1')) {
      return 1;
    }
    if (location.startsWith('2')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/books/0');
        break;
      case 1:
        GoRouter.of(context).go('/books/1');
        break;
      case 2:
        GoRouter.of(context).go('/books/2');
        break;
    }
  }
}

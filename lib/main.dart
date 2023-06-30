import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'model/book_model.dart';
import 'pages/detail_page.dart';
import 'pages/scafold_with_navbar.dart';
import 'pages/unknown_screen.dart';

void main() {
  runApp(const MainApp());
}

final List<Book> books = [
  Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
  Book('Too Like the Lightning', 'Ada Palmer'),
  Book('Kindred', 'Octavia E. Butler'),
];

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter _router = GoRouter(
  errorBuilder: (context, state) => const UnknownScreen(),
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/books/0',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/books/:id',
          builder: (BuildContext context, GoRouterState state) {
            return BookDetailPage(
              book: books[int.parse(state.pathParameters['id'].toString())],
            );
          },
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

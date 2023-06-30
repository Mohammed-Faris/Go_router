import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/book_model.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({super.key});

  @override
  State<BooksListScreen> createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  final List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  bool isLoading = false;

  void navigateToDetailPage(BuildContext context, List<Book> books, Book book) {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });

      context.go('/books/${books.indexOf(book)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          //  isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     :
          ListView(
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
    );
  }
}

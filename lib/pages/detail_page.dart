import 'package:flutter/material.dart';

import '../model/book_model.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.title, style: Theme.of(context).textTheme.titleLarge),
            Text(book.author, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

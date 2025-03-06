import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 20,
                children: <Widget>[
                  const BookDetailsAppBar(),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.47,
                    child: const CustomBookItem(),
                  ),
                  const Text(
                    "Harry Potter and The Goblet of Fire",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

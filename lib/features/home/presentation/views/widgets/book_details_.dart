import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.title,
    required this.author,
  });
  final String title, author;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.styleSemiBold30,
        ),
        Text(
          author,
          style: AppStyles.styleSemiBold18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const BookRating(),
      ],
    );
  }
}

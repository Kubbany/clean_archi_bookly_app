import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 7,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const StarredBook(),
        const Text(
          "4.8",
          style: AppStyles.styleMedium16,
        ),
        Text(
          "(2455)",
          style: AppStyles.styleNormal14.copyWith(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class StarredBook extends StatefulWidget {
  const StarredBook({super.key});

  @override
  State<StarredBook> createState() => _StarredBookState();
}

class _StarredBookState extends State<StarredBook> {
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isStarred = !isStarred;
        setState(
          () {},
        );
      },
      child: Icon(
        FontAwesomeIcons.solidStar,
        size: 20,
        color: isStarred ? const Color(0xFFFFDD4F) : Colors.grey[800],
      ),
    );
  }
}

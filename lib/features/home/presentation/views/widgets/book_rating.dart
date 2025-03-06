import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const StarredBook(),
        const Text(
          "4.8",
          style: AppStyles.styleMedium16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "(2455)",
          style: AppStyles.styleNormal14.copyWith(
            color: const Color(0xff707070),
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
    return IconButton(
      onPressed: () {
        isStarred = !isStarred;
        setState(
          () {},
        );
      },
      icon: Icon(
        FontAwesomeIcons.solidStar,
        size: 20,
        color: isStarred ? const Color(0xFFFFDD4F) : Colors.grey[800],
      ),
    );
  }
}

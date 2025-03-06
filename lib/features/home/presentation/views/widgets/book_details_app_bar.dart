import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppBar extends StatelessWidget {
  const BookDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(
          Icons.close,
          size: 32,
        ),
      ),
      trailingIcon: Icons.shopping_cart_outlined,
      trailingOnPressed: () {},
    );
  }
}

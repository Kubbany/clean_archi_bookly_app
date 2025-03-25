import 'package:bookly_app/core/utils/functions/luanch_custom_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({
    super.key,
    required this.url,
    required this.pdf,
  });
  final String? url;
  final String? pdf;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomButton(
            onPressed: () {
              luanchCustomUrl(
                context,
                pdf,
              );
            },
            child: pdf == null ? "Unavailable" : "Free",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              luanchCustomUrl(context, url);
            },
            child: url == null ? "Unavailable" : "Free Preview",
            fontSize: 16,
            textColor: Colors.white,
            backgroundColor: const Color(0xFFEF8262),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}

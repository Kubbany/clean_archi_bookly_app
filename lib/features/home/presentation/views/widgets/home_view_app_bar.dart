import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
//import 'package:bookly_app/features/search/presentation/pages/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: Image.asset(
        AppAssets.logo,
        height: 22,
      ),
      trailingIcon: FontAwesomeIcons.magnifyingGlass,
      trailingOnPressed: () {
        // showSearch(
        //   context: context,
        //   delegate: SearchView(),
        // );
      },
    );
  }
}

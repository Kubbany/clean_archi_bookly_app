// import 'package:bookly_app/core/utils/app_styles.dart';
// import 'package:bookly_app/features/home/presentation/views/widgets/newest_list_view_item.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SearchView extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {},
//         icon: const Icon(
//           FontAwesomeIcons.magnifyingGlass,
//           size: 20,
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () => Navigator.of(context).pop(),
//       // Exit from the search screen.
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Results",
//             style: AppStyles.styleSemiBold18,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Expanded(
//             child: ListView.separated(
//               itemCount: 15,
//               separatorBuilder: (context, index) => const SizedBox(
//                 height: 10,
//               ),
//               itemBuilder: (context, index) => const NewestListViewItem(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return buildResults(context);
//   }
// }

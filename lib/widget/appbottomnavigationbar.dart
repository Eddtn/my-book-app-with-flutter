// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class AppBottomNavigationBar extends StatelessWidget {
//   const AppBottomNavigationBar(
//       {Key? key, required this.selectedIndex, this.onTap})
//       : super(key: key);

//   final int selectedIndex;
//   final Function(int)? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       selectedFontSize: 12,
//       unselectedFontSize: 12,
//       selectedLabelStyle: Theme.of(context).textTheme.headline5,
//       unselectedLabelStyle: Theme.of(context).textTheme.headline5,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: selectedIndex == 0
//               ? SvgPicture.asset('assets/images/icon_send_parcel_grey.svg')
//               : SvgPicture.asset('assets/images/icon_send_parcel_grey.svg'),
//           label: 'null',
//         ),
//         BottomNavigationBarItem(
//             icon: selectedIndex == 1
//                 ? SvgPicture.asset('assets/images/icon_send_parcel_grey.svg')
//                 : SvgPicture.asset('assets/images/icon_send_parcel_grey.svg'),
//             label: 'null'),
//         BottomNavigationBarItem(
//           icon: selectedIndex == 2
//               ? SvgPicture.asset('assets/images/icon_send_parcel_grey.svg')
//               : SvgPicture.asset('assets/images/icon_send_parcel_grey.svg'),
//           label: 'null',
//         ),
//         BottomNavigationBarItem(
//           icon: selectedIndex == 3
//               ? SvgPicture.asset('assets/images/icon_send_parcel_grey.svg')
//               : SvgPicture.asset('assets/images/icon_send_parcel_grey.svg'),
//           label: 'null',
//         ),
//       ],
//     );
//   }
// }

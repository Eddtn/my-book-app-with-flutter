import 'package:flutter/material.dart';

Map<int, Color> _primaryColor = {
  50: const Color.fromARGB(255, 73, 99, 248).withOpacity(0.1),
  100: const Color.fromARGB(255, 109, 85, 243).withOpacity(0.2),
  200: const Color.fromARGB(255, 36, 148, 192).withOpacity(0.3),
  300: const Color.fromARGB(255, 54, 43, 211).withOpacity(0.4),
  400: const Color.fromARGB(255, 24, 11, 145).withOpacity(0.5),
  500: const Color.fromARGB(255, 51, 11, 145).withOpacity(0.6),
  600: const Color.fromARGB(255, 74, 11, 145).withOpacity(0.7),
  700: const Color.fromARGB(255, 31, 11, 145).withOpacity(0.8),
  800: const Color.fromARGB(255, 20, 11, 145).withOpacity(0.9),
  900: const Color.fromARGB(255, 31, 11, 145),
};
final MaterialColor kPrimaryColor = MaterialColor(0xFF140B91, _primaryColor);

Map<int, Color> _lightPrimaryColor = {
  100: const Color(0XFF20C6FF).withOpacity(0.2),
  200: const Color(0XFF20C6FF).withOpacity(0.3),
  300: const Color(0XFF20C6FF).withOpacity(0.4),
  400: const Color(0XFF20C6FF).withOpacity(0.5),
  500: const Color(0XFF20C6FF).withOpacity(0.6),
  600: const Color(0XFF20C6FF).withOpacity(0.7),
  700: const Color(0XFF20C6FF).withOpacity(0.8),
  800: const Color(0XFF20C6FF).withOpacity(0.9),
  900: const Color(0XFF20C6FF),
};

final MaterialColor kLightPrimaryColor =
    MaterialColor(0XFF20C6FF, _lightPrimaryColor);

const Map<int, Color> _textColor = {
  50: Color(0XFFF7F7F7),
  100: Color(0XFFE0E0E0),
  200: Color(0XFFBDBDBD),
  300: Color(0XFF828282),
  400: Color(0XFF4F4F4F), //.withOpacity(0.5),
  500: Color(0XFF4F4F4F), //.withOpacity(0.6),
  600: Color(0XFF4F4F4F), //.withOpacity(0.7),
  700: Color(0XFF4F4F4F), //.withOpacity(0.8),
  800: Color(0XFF4F4F4F), //.withOpacity(0.9),
  900: Color(0XFF4F4F4F),
};

const MaterialColor kTextColor = MaterialColor(0XFF4F4F4F, _textColor);

Map<int, Color> _accentColor = {
  50: const Color(0XFFFFFFFF),
  100: const Color(0XFFF7F7F7),
  200: const Color(0XFF282828),
  300: const Color(0XFF1D1D1D),
  400: const Color(0XFF000000).withOpacity(0.5),
  500: const Color(0XFF000000).withOpacity(0.6),
  600: const Color(0XFF000000).withOpacity(0.7),
  700: const Color(0XFF000000).withOpacity(0.8),
  800: const Color(0XFF000000).withOpacity(0.9),
  900: const Color(0XFF000000),
};

final MaterialColor kAccentColor = MaterialColor(0XFF4F4F4F, _accentColor);

Map<int, Color> _errorColor = {
  50: const Color(0XFFEB5757).withOpacity(0.1),
  100: const Color(0XFFEB5757).withOpacity(0.2),
  200: const Color(0XFFEB5757).withOpacity(0.3),
  300: const Color(0XFFEB5757).withOpacity(0.4),
  400: const Color(0XFFEB5757).withOpacity(0.5),
  500: const Color(0XFFEB5757).withOpacity(0.6),
  600: const Color(0XFFEB5757).withOpacity(0.7),
  700: const Color(0XFFEB5757).withOpacity(0.8),
  800: const Color(0XFFEB5757).withOpacity(0.9),
  900: const Color(0XFFEB5757),
};

final MaterialColor kErrorColor = MaterialColor(0XFFEB5757, _errorColor);

Map<int, Color> _warningColor = {
  50: const Color(0XFFE2B93B).withOpacity(0.1),
  100: const Color(0XFFE2B93B).withOpacity(0.2),
  200: const Color(0XFFE2B93B).withOpacity(0.3),
  300: const Color(0XFFE2B93B).withOpacity(0.4),
  400: const Color(0XFFE2B93B).withOpacity(0.5),
  500: const Color(0XFFE2B93B).withOpacity(0.6),
  600: const Color(0XFFE2B93B).withOpacity(0.7),
  700: const Color(0XFFE2B93B).withOpacity(0.8),
  800: const Color(0XFFE2B93B).withOpacity(0.9),
  900: const Color(0XFFE2B93B),
};

final MaterialColor kWarningColor = MaterialColor(0XFFE2B93B, _warningColor);

Map<int, Color> _infoColor = {
  50: const Color(0XFF2F80ED).withOpacity(0.1),
  100: const Color(0XFF2F80ED).withOpacity(0.2),
  200: const Color(0XFF2F80ED).withOpacity(0.3),
  300: const Color(0XFF2F80ED).withOpacity(0.4),
  400: const Color(0XFF2F80ED).withOpacity(0.5),
  500: const Color(0XFF2F80ED).withOpacity(0.6),
  600: const Color(0XFF2F80ED).withOpacity(0.7),
  700: const Color(0XFF2F80ED).withOpacity(0.8),
  800: const Color(0XFF2F80ED).withOpacity(0.9),
  900: const Color(0XFF2F80ED),
};

final MaterialColor kInfoColor = MaterialColor(0XFF2F80ED, _infoColor);

Map<int, Color> _successColor = {
  50: const Color(0XFF27AE60).withOpacity(0.1),
  100: const Color(0XFF27AE60).withOpacity(0.2),
  200: const Color(0XFF27AE60).withOpacity(0.3),
  300: const Color(0XFF27AE60).withOpacity(0.4),
  400: const Color(0XFF27AE60).withOpacity(0.5),
  500: const Color(0XFF27AE60).withOpacity(0.6),
  600: const Color(0XFF27AE60).withOpacity(0.7),
  700: const Color(0XFF27AE60).withOpacity(0.8),
  800: const Color(0XFF27AE60).withOpacity(0.9),
  900: const Color(0XFF27AE60),
};

final MaterialColor kSuccessColor = MaterialColor(0XFF27AE60, _successColor);
Color kSkelenton = Colors.black.withOpacity(0.1);

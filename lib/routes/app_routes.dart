import 'package:flutter/material.dart';

import '../presentation/calculator_screen/calculator_screen.dart';
import '../presentation/settings_screen/settings_screen.dart';
import '../presentation/unit_converter_screen/unit_converter_screen.dart';

class AppRoutes {
  static const String calculator = '/calculator';
  static const String converter = '/converter';
  static const String settings = '/settings';
}

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    AppRoutes.calculator: (context) => const CalculatorScreen(),
    AppRoutes.converter: (context) => const UnitConverterScreen(),
    AppRoutes.settings: (context) => const SettingsScreen(),
  };
}

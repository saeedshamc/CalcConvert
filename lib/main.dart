import 'package:flutter/material.dart';

import 'core/app_export.dart';

void main() {
  runApp(const CalcConvertApp());
}

class CalcConvertApp extends StatefulWidget {
  const CalcConvertApp({super.key});

  @override
  State<CalcConvertApp> createState() => _CalcConvertAppState();
}

class _CalcConvertAppState extends State<CalcConvertApp> {
  final ThemeProvider _themeProvider = ThemeProvider();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, child) {
        return MaterialApp(
          title: 'CalcConvert',
          debugShowCheckedModeBanner: false,
          theme: _themeProvider.isDarkMode ? AppTheme.darkTheme() : AppTheme.lightTheme(),
          routes: buildAppRoutes(),
          home: _buildHome(),
        );
      },
    );
  }

  Widget _buildHome() {
    return AppScaffold(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 1:
        return const UnitConverterScreen();
      case 2:
        return const SettingsScreen();
      case 0:
      default:
        return const CalculatorScreen();
    }
  }
}

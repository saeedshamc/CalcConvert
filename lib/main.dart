import 'package:flutter/material.dart';

void main() {
  runApp(const CalcConvertApp());
}

class CalcConvertApp extends StatelessWidget {
  const CalcConvertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalcConvert',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _inputController = TextEditingController(text: '1');
  String _selectedCategory = 'Length';
  String _fromUnit = 'meter';
  String _toUnit = 'kilometer';
  String _result = '1.00';

  final Map<String, List<String>> _units = {
    'Length': ['meter', 'kilometer', 'foot', 'mile'],
    'Weight': ['kilogram', 'gram', 'pound', 'ounce'],
    'Temperature': ['celsius', 'fahrenheit', 'kelvin'],
  };

  final Map<String, Map<String, double>> _conversionRates = {
    'Length': {
      'meter': 1.0,
      'kilometer': 1000.0,
      'foot': 0.3048,
      'mile': 1609.344,
    },
    'Weight': {
      'kilogram': 1.0,
      'gram': 0.001,
      'pound': 0.45359237,
      'ounce': 0.028349523125,
    },
    'Temperature': {
      'celsius': 1.0,
      'fahrenheit': 1.0,
      'kelvin': 1.0,
    },
  };

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _calculate() {
    final inputValue = double.tryParse(_inputController.text) ?? 0.0;

    if (_selectedCategory == 'Temperature') {
      final converted = _convertTemperature(inputValue, _fromUnit, _toUnit);
      _result = converted.toStringAsFixed(2);
    } else {
      final baseValue = inputValue * (_conversionRates[_selectedCategory]![_fromUnit]!);
      final convertedValue = baseValue / (_conversionRates[_selectedCategory]![_toUnit]!);
      _result = convertedValue.toStringAsFixed(2);
    }

    setState(() {});
  }

  double _convertTemperature(double value, String from, String to) {
    if (from == to) return value;

    final celsius = switch (from) {
      'celsius' => value,
      'fahrenheit' => (value - 32) * 5 / 9,
      'kelvin' => value - 273.15,
      _ => value,
    };

    return switch (to) {
      'celsius' => celsius,
      'fahrenheit' => celsius * 9 / 5 + 32,
      'kelvin' => celsius + 273.15,
      _ => celsius,
    };
  }

  @override
  Widget build(BuildContext context) {
    final units = _units[_selectedCategory] ?? _units['Length']!;

    if (!units.contains(_fromUnit)) {
      _fromUnit = units.first;
    }
    if (!units.contains(_toUnit)) {
      _toUnit = units.first;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CalcConvert'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fast and clean conversions',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Convert values between common units with a simple and modern experience.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(labelText: 'Category'),
                        items: _units.keys
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedCategory = value;
                            _fromUnit = (_units[value] ?? _units['Length']!).first;
                            _toUnit = (_units[value] ?? _units['Length']!).last;
                            _calculate();
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _inputController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Value'),
                        onChanged: (_) => _calculate(),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _fromUnit,
                              decoration: const InputDecoration(labelText: 'From'),
                              items: units
                                  .map(
                                    (unit) => DropdownMenuItem(
                                      value: unit,
                                      child: Text(unit),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _fromUnit = value;
                                  _calculate();
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _toUnit,
                              decoration: const InputDecoration(labelText: 'To'),
                              items: units
                                  .map(
                                    (unit) => DropdownMenuItem(
                                      value: unit,
                                      child: Text(unit),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _toUnit = value;
                                  _calculate();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Result',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '$_result ${_toUnit}',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

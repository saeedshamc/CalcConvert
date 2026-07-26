import '../../core/app_export.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: const Center(
        child: Text('Calculator screen placeholder'),
      ),
    );
  }
}

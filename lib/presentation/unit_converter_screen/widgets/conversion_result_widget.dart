import '../../../core/app_export.dart';

class ConversionResultWidget extends StatelessWidget {
  const ConversionResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Result', style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 8),
            Text('1.00 kilometer', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}

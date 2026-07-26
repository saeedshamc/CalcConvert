import '../../../core/app_export.dart';

class HeroDisplayWidget extends StatelessWidget {
  const HeroDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text('Expression and result'),
    );
  }
}

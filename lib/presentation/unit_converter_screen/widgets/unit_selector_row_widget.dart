import '../../../core/app_export.dart';

class UnitSelectorRowWidget extends StatelessWidget {
  const UnitSelectorRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: 'meter',
            decoration: const InputDecoration(labelText: 'From'),
            items: const [
              DropdownMenuItem(value: 'meter', child: Text('meter')),
              DropdownMenuItem(value: 'kilometer', child: Text('kilometer')),
            ],
            onChanged: (_) {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: 'kilometer',
            decoration: const InputDecoration(labelText: 'To'),
            items: const [
              DropdownMenuItem(value: 'meter', child: Text('meter')),
              DropdownMenuItem(value: 'kilometer', child: Text('kilometer')),
            ],
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}

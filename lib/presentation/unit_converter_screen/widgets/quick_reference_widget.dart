import '../../../core/app_export.dart';

class QuickReferenceWidget extends StatelessWidget {
  const QuickReferenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Quick reference'),
      children: const [
        ListTile(title: Text('1 meter = 0.001 kilometer')),
        ListTile(title: Text('1 foot = 0.3048 meter')),
      ],
    );
  }
}

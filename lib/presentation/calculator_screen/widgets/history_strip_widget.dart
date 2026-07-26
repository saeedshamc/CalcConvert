import '../../../core/app_export.dart';

class HistoryStripWidget extends StatelessWidget {
  const HistoryStripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Chip(label: Text('2 + 2')),
          Chip(label: Text('10 / 2')),
          Chip(label: Text('7 × 3')),
        ],
      ),
    );
  }
}

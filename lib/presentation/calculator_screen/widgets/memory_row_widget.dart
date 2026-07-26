import '../../../core/app_export.dart';

class MemoryRowWidget extends StatelessWidget {
  const MemoryRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        OutlinedButton(onPressed: null, child: Text('M+')),
        OutlinedButton(onPressed: null, child: Text('M-')),
        OutlinedButton(onPressed: null, child: Text('MR')),
        OutlinedButton(onPressed: null, child: Text('MC')),
      ],
    );
  }
}

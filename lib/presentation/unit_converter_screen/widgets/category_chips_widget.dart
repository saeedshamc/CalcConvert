import '../../../core/app_export.dart';

class CategoryChipsWidget extends StatelessWidget {
  const CategoryChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        FilterChip(label: Text('Length'), onSelected: null),
        FilterChip(label: Text('Weight'), onSelected: null),
        FilterChip(label: Text('Temperature'), onSelected: null),
      ],
    );
  }
}

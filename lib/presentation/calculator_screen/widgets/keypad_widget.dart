fimport '../../../core/app_export.dart';

class KeypadWidget extends StatelessWidget {
  const KeypadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = ['7', '8', '9', '/', '4', '5', '6', '×', '1', '2', '3', '-', '0', '.', '=', '+'];

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: keys.map((key) {
        return FilledButton(
          onPressed: () {},
          child: Text(key),
        );
      }).toList(),
    );
  }
}

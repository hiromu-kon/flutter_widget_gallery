import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';
import 'package:gap/gap.dart';

class SnackBarSection extends StatelessWidget {
  const SnackBarSection({super.key});

  static const title = 'SnackBar';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Center(
        child: Column(
          children: [
            const Gap(contentPadding),
            CustomButton(
              text: 'Show Snackbar',
              onPressed: () => _showSnackBar(context),
            ),
            const Gap(contentPadding),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Hello!'),
      behavior: SnackBarBehavior.floating,
    ));
  }
}

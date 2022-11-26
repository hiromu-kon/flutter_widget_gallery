import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';
import 'package:gap/gap.dart';

class ModalBottomSheetSection extends StatelessWidget {
  const ModalBottomSheetSection({super.key});

  static const title = 'ModalBottomSheet';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Center(
        child: Column(
          children: [
            const Gap(contentPadding),
            CustomButton(
              text: 'Show ModalBottomSheet',
              onPressed: () => _showModalBottomSheet(context),
            ),
            const Gap(contentPadding),
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => ListView(
        children: [
          const Gap(20),
          ...ThemeMode.values.map(
            (themeMode) => ListTile(
              title: Text(themeMode.name),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

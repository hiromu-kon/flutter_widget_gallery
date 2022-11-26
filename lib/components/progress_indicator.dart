import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';
import 'package:gap/gap.dart';

class ProgressIndicatorSection extends StatelessWidget {
  const ProgressIndicatorSection({super.key});

  static const title = 'ProgressIndicator';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Column(
        children: const [
          Gap(contentPadding),
          LinearProgressIndicator(),
          Gap(contentPadding),
          CircularProgressIndicator(),
          Gap(contentPadding),
        ],
      ),
    );
  }
}

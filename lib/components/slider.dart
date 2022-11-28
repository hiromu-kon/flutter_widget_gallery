import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';
import 'package:gap/gap.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  static const title = 'Slider';

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: SliderSection.title,
      content: Column(
        children: [
          const Gap(contentPadding),
          Slider(
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              }),
          const Gap(contentPadding),
        ],
      ),
    );
  }
}

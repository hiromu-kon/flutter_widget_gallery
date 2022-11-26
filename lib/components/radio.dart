import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';
import 'package:gap/gap.dart';

class RadioSection extends StatelessWidget {
  const RadioSection({super.key});

  static const title = 'Radio';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Column(
        children: const [
          Gap(20),
          _ThemeModeRadioGroup(),
          Gap(20),
        ],
      ),
    );
  }
}

class _ThemeModeRadioGroup extends StatefulWidget {
  const _ThemeModeRadioGroup();

  @override
  State<_ThemeModeRadioGroup> createState() => _ThemeModeRadioGroupState();
}

class _ThemeModeRadioGroupState extends State<_ThemeModeRadioGroup> {
  ThemeMode current = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ThemeMode.values
          .map(
            (themeMode) => Row(
              children: [
                Radio<ThemeMode>(
                  value: themeMode,
                  groupValue: current,
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        current = value;
                      }
                    });
                  },
                ),
                const Gap(contentPadding),
                Text(themeMode.name),
              ],
            ),
          )
          .toList(),
    );
  }
}

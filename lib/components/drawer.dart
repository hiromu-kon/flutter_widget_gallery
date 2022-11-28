import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_gallery/components/button.dart';
import 'package:flutter_widget_gallery/components/card.dart';
import 'package:flutter_widget_gallery/components/checkbox.dart';
import 'package:flutter_widget_gallery/components/dialog.dart';
import 'package:flutter_widget_gallery/components/list.dart';
import 'package:flutter_widget_gallery/components/modal_bottom_sheet.dart';
import 'package:flutter_widget_gallery/components/progress_indicator.dart';
import 'package:flutter_widget_gallery/components/radio.dart';
import 'package:flutter_widget_gallery/components/slider.dart';
import 'package:flutter_widget_gallery/components/snack_bar.dart';
import 'package:flutter_widget_gallery/components/text_field.dart';
import 'package:flutter_widget_gallery/main.dart';
import 'package:flutter_widget_gallery/pages/bottom_navigation_bar.dart';
import 'package:flutter_widget_gallery/pages/tab_bar.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({
    super.key,
    required this.itemController,
  });

  final ItemScrollController itemController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> drawerMenu = [
      ButtonSection.title,
      CardSection.title,
      ProgressIndicatorSection.title,
      CheckboxSection.title,
      RadioSection.title,
      SliderSection.title,
      ListSection.title,
      TextFieldSection.title,
      TabBarSection.title,
      BottomNavigationBarSection.title,
      SnackBarSection.title,
      DialogSection.title,
      ModalBottomSheetSection.title,
    ];
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: drawerMenu.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(drawerMenu[index]),
                onTap: () async {
                  Navigator.pop(context);
                  itemController.scrollTo(
                    index: index,
                    duration: const Duration(milliseconds: 400),
                  );
                },
              ),
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Material 3'),
              value: ref.watch(useMaterial3Provider),
              onChanged: (bool value) {
                ref
                    .read(useMaterial3Provider.notifier)
                    .update((state) => value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

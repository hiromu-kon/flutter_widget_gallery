import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_gallery/components/button.dart';
import 'package:flutter_widget_gallery/components/card.dart';
import 'package:flutter_widget_gallery/components/checkbox.dart';
import 'package:flutter_widget_gallery/components/dialog.dart';
import 'package:flutter_widget_gallery/components/drawer.dart';
import 'package:flutter_widget_gallery/components/list.dart';
import 'package:flutter_widget_gallery/components/modal_bottom_sheet.dart';
import 'package:flutter_widget_gallery/components/progress_indicator.dart';
import 'package:flutter_widget_gallery/components/radio.dart';
import 'package:flutter_widget_gallery/components/slider.dart';
import 'package:flutter_widget_gallery/components/snack_bar.dart';
import 'package:flutter_widget_gallery/components/text_field.dart';
import 'package:flutter_widget_gallery/pages/bottom_navigation_bar.dart';
import 'package:flutter_widget_gallery/pages/tab_bar.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WidgetGalleryPage extends ConsumerStatefulWidget {
  const WidgetGalleryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WidgetGalleryPageState();
}

class _WidgetGalleryPageState extends ConsumerState<WidgetGalleryPage> {
  final itemController = ItemScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        itemController: itemController,
      ),
      appBar: AppBar(
        title: const Text('Widget Gallery'),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: _listSectionWidget().length,
        itemBuilder: (context, index) {
          final item = _listSectionWidget()[index];

          if (_listSectionWidget().length == index + 1) {
            return SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              child: item,
            );
          }
          return item;
        },
        itemScrollController: itemController,
      ),
    );
  }

  List<Widget> _listSectionWidget() {
    return const [
      ButtonSection(),
      CardSection(),
      ProgressIndicatorSection(),
      CheckboxSection(),
      RadioSection(),
      SliderSection(),
      ListSection(),
      TextFieldSection(),
      TabBarSection(),
      BottomNavigationBarSection(),
      SnackBarSection(),
      DialogSection(),
      ModalBottomSheetSection(),
    ];
  }
}

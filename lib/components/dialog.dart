import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';

import 'package:gap/gap.dart';

class DialogSection extends StatelessWidget {
  const DialogSection({super.key});

  static const title = 'Dialog';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Center(
        child: Column(
          children: [
            const Gap(contentPadding),
            CustomButton(
              text: 'Show AlertDialog',
              onPressed: () => _showAlertDialog(context),
            ),
            const Gap(contentPadding),
            CustomButton(
              text: 'Show SimpleDialog',
              onPressed: () => _showSimpleDialog(context),
            ),
            const Gap(contentPadding),
          ],
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          //必須の引数
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

  void _showSimpleDialog(BuildContext context) async =>
      await showDialog<String>(
        context: context, //必須の引数
        builder: (BuildContext context) {
          //必須の引数
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Treasury');
                },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'State');
                },
                child: const Text('State department'),
              ),
            ],
          );
        },
      );
}

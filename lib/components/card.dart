import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';

import 'package:gap/gap.dart';

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  static const title = 'Card';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Column(
        children: [
          const Gap(contentPadding),
          const _CardBox(
            child: Card(
              child: _Body(
                title: 'Elevated',
              ),
            ),
          ),
          const Gap(contentPadding),
          _CardBox(
            child: Card(
              color: Theme.of(context).colorScheme.surfaceVariant,
              elevation: 0,
              borderOnForeground: true,
              semanticContainer: true,
              child: const _Body(
                title: 'Filled',
              ),
            ),
          ),
          const Gap(contentPadding),
          _CardBox(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              borderOnForeground: true,
              semanticContainer: true,
              child: const InkWell(
                child: _Body(
                  title: 'Outlined',
                ),
              ),
            ),
          ),
          const Gap(contentPadding),
        ],
      ),
    );
  }
}

class _CardBox extends StatelessWidget {
  const _CardBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: child,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(title),
        ),
      ],
    );
  }
}

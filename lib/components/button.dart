import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/components/common.dart';
import 'package:gap/gap.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  static const title = 'Button';

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      content: Column(
        children: [
          const Gap(contentPadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Elevated'),
          ),
          const Gap(contentPadding),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined'),
          ),
          const Gap(contentPadding),
          TextButton(
            onPressed: () {},
            child: const Text('Text'),
          ),
          const Gap(contentPadding),
          FloatingActionButton(
            backgroundColor: Colors.green[900],
            onPressed: () {},
            child: const Icon(Icons.access_alarm),
          ),
          const Gap(contentPadding),
          FloatingActionButton.extended(
            backgroundColor: Colors.green[900],
            onPressed: () {},
            label: const Text('New task'),
            icon: const Icon(Icons.add),
          ),
          const Gap(contentPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
              const Gap(20),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark),
              ),
            ],
          ),
          const Gap(contentPadding),
          const _DropdownButton(),
          const Gap(contentPadding),
          const _PopupMenuButton(),
          const Gap(contentPadding),
        ],
      ),
    );
  }
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _DropdownButton extends StatefulWidget {
  const _DropdownButton();

  @override
  State<_DropdownButton> createState() => _DropdownButtonSampleState();
}

class _DropdownButtonSampleState extends State<_DropdownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // disabledHint: Text('Dropdown'),
      value: dropdownValue,
      elevation: 16,
      hint: const Text(
        "Select Dropdown Item",
        style: TextStyle(color: Colors.grey),
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _PopupMenuButton extends StatefulWidget {
  const _PopupMenuButton();

  @override
  State<_PopupMenuButton> createState() => __PopupMenuButtonState();
}

class __PopupMenuButtonState extends State<_PopupMenuButton> {
  String _selectedValue = 'initial';
  final List<String> _items = ['a', 'b', 'c', 'd'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PopupMenuButton<String>(
          initialValue: _selectedValue,
          onSelected: (String s) {
            setState(() {
              _selectedValue = s;
            });
          },
          itemBuilder: (BuildContext context) {
            return _items
                .map((String text) => PopupMenuItem(
                      value: text,
                      child: Text(text),
                    ))
                .toList();
          },
        ),
        const Gap(contentPadding),
        Text(
          _selectedValue,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

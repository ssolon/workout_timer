import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Configure when the timer beeps

enum SoundEvery {
  second('every second'),
  tenSecond('every 10 seconds'),
  thirtySecond('every 30 seconds'),
  minute('every minute');

  final String title;

  const SoundEvery(this.title);
}

class SoundConfigurationWidget extends ConsumerWidget {
  SoundConfigurationWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: <Widget>[
      FormBuilder(
          key: _formKey,
          child: Column(children: [
            FormBuilderSwitch(
              name: 'sound',
              title: Text(
                'Sound Effects',
                style: _headerTextStyle(context),
              ),
              initialValue: true,
            ),
            _checkBox(context, 'start', 'Start'),
            _checkBox(context, 'stop', 'Stop'),
            _checkBox(context, 'reset', 'Reset'),
            _periodicSound(context, 'ticks', 'Tick', 1),
            _periodicSound(context, 'beeps', 'Beep', 4),
          ])),
    ]);
  }

  _checkBox(BuildContext context, name, title) {
    return Row(children: [
      Expanded(
        child: FormBuilderCheckbox(
            name: name, title: Text(title, style: _itemTextStyle(context))),
      ),
    ]);
  }

  _periodicSound(BuildContext context, name, title, initial) {
    final style = _itemTextStyle(context);

    return Row(children: [
      Expanded(
          child: FormBuilderCheckbox(
        name: name + 'Enabled',
        title: Text(
          title,
          style: style,
        ),
      )),
      Expanded(
        child: FormBuilderDropdown(
          name: name + 'Period',
          initialValue: initial,
          items: _soundsPer(style),
        ),
      ),
    ]);
  }

  _soundsPer(style) {
    int i = 1;
    return [
      for (final v in SoundEvery.values)
        DropdownMenuItem(value: i++, child: Text(v.title, style: style)),
    ];
  }

  _headerTextStyle(context) => Theme.of(context).textTheme.headline6;
  _itemTextStyle(context) => Theme.of(context).textTheme.labelLarge;
}

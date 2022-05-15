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

  static Map<String, SoundEvery> map = {};

  /// Convert [s] to an enum entry (or null)
  static SoundEvery? from(String s) {
  
    if (map.isEmpty) {
      for (final e in SoundEvery.values) {
        map[e.name] = e;
      }
    }

    return map[s];
  }
}

class SoundConfigurationWidget extends ConsumerStatefulWidget {
  const SoundConfigurationWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SoundConfigurationWidgetState();
}

class _SoundConfigurationWidgetState extends ConsumerState {
  bool _soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpansionTile(
          title: Row(children: [
            Text(
              'Sound Effects',
              style: _headerTextStyle(context),
            ),
            Switch(
              value: _soundEnabled,
              onChanged: (enabled) {
                setState(() {
                  _soundEnabled = enabled;
                });
              },
            ),
          ]),
          initiallyExpanded: true,
          children: [
            _checkBox(context, 'start', 'Start'),
            _checkBox(context, 'stop', 'Stop'),
            _checkBox(context, 'reset', 'Reset'),
            _periodicSound(context, 'ticks', 'Tick', 1),
            _periodicSound(context, 'beeps', 'Beep', 4),
          ]),
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

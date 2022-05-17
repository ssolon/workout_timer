import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_provider.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_state.dart';

/// Configure when the timer beeps/ticks

class SoundConfigurationWidget extends ConsumerWidget {
  const SoundConfigurationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(soundSettingsNotifierProvider);
    final notifier = ref.read(soundSettingsNotifierProvider.notifier);

    return Column(children: [
      provider.map(
        (settings) => ExpansionTile(
            title: Row(children: [
              Text(
                'Sound Effects',
                style: _headerTextStyle(context),
              ),
              Switch(
                value: settings.enabled,
                onChanged: (isEnabled) {
                  notifier.setEnabled(isEnabled);
                },
              ),
            ]),
            initiallyExpanded: settings.expanded,
            onExpansionChanged: (isExpanded) {
              notifier.setExpanded(isExpanded);
            },
            children: [
              _checkBox(
                  context, 'start', 'Start', settings.start, notifier.setStart),
              _checkBox(
                  context, 'stop', 'Stop', settings.stop, notifier.setStop),
              _checkBox(
                  context, 'reset', 'Reset', settings.reset, notifier.setReset),
              _periodicSound(context, 'ticks', 'Tick', settings.tick,
                  notifier.setTick, settings.tickEvery, notifier.setTickEvery),
              _periodicSound(context, 'beeps', 'Beep', settings.beep,
                  notifier.setBeep, settings.beepEvery, notifier.setBeepEvery),
            ]),
        initial: (initial) => const Text('Initializing settings'),
        loading: (loading) => const Text('Settings are loading...'),
        error: (msg) => Text("An error has occurred:$msg"),
      ),
    ]);
  }

  _checkBox(BuildContext context, String name, String title, bool initial,
      [void Function(bool?)? setter]) {
    return Row(children: [
      Expanded(
        child: FormBuilderCheckbox(
          name: name,
          title: Text(
            title,
            style: _itemTextStyle(context),
          ),
          initialValue: initial,
          onChanged: setter,
        ),
      ),
    ]);
  }

  _periodicSound(BuildContext context, name, title, bool initial,
      void Function(bool?)? setter, SoundEvery initialEvery,
      [void Function(SoundEvery?)? setterEvery]) {
    final style = _itemTextStyle(context);

    return Row(children: [
      Expanded(
          child: FormBuilderCheckbox(
        name: name + 'Enabled',
        title: Text(
          title,
          style: style,
        ),
        initialValue: initial,
        onChanged: setter,
      )),
      Expanded(
        child: FormBuilderDropdown(
          name: name + 'Period',
          initialValue: initialEvery,
          onChanged: setterEvery,
          items: _soundsPer(style),
        ),
      ),
    ]);
  }

  _soundsPer(style) {
    int i = 1;
    return [
      for (final v in SoundEvery.values)
        DropdownMenuItem(value: v, child: Text(v.title, style: style)),
    ];
  }

  _headerTextStyle(context) => Theme.of(context).textTheme.headline6;
  _itemTextStyle(context) => Theme.of(context).textTheme.labelLarge;
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Configure when the timer beeps

class BeepConfigurationWidget extends ConsumerWidget {
  BeepConfigurationWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: <Widget>[
      FormBuilder(
          key: _formKey,
          child: Column(children: [
            FormBuilderCheckbox(
              name: 'ticks',
              title: const Text('Ticks'),
            )
          ])),
    ]);
  }
}

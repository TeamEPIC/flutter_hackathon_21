import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterStateConsumerWidgetBuilder extends ConsumerWidget {
  RegisterStateConsumerWidgetBuilder(
      {@required this.registerWidgetBuilder,
      @required this.homeWidgetBuilder,
      @required this.loadingWidgetBuilder});

  final WidgetBuilder loadingWidgetBuilder;
  final WidgetBuilder registerWidgetBuilder;
  final WidgetBuilder homeWidgetBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return watch(RegisterStateNotifier.provider.state).when(
        (value) =>
            value ? homeWidgetBuilder(context) : registerWidgetBuilder(context),
        loading: () => loadingWidgetBuilder(context),
        error: (message) => ErrorWidget('$message'));
  }
}

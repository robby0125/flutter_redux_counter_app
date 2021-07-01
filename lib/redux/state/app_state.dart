import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';

part 'app_state.g.dart';

@immutable
@CopyWith()
class AppState {
  final int counterValue;

  const AppState({
    this.counterValue = 0,
  });
}

import 'package:flutter_redux_counter_app/redux/actions/counter_actions.dart';
import 'package:flutter_redux_counter_app/redux/state/app_state.dart';

const Map<Type, Function> counterReducer = {
  AddAction: _addReducer,
  SubtractAction: _subtractReducer,
};

AppState _addReducer(AddAction action, AppState state) {
  int counterVal = state.counterValue + 1;
  return state.copyWith(counterValue: counterVal);
}

AppState _subtractReducer(SubtractAction action, AppState state) {
  int counterVal = state.counterValue - 1;
  return state.copyWith(counterValue: counterVal);
}

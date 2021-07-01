import 'package:flutter_redux_counter_app/redux/reducers/counter_reducer.dart';
import 'package:flutter_redux_counter_app/redux/state/app_state.dart';

final Map<Type, Function> _reducers = Map()
    ..addAll(counterReducer);

AppState reduce(AppState state, dynamic action) {
  for (var _actionType in _reducers.keys) {
    if (action.runtimeType == _actionType) {
      return _reducers[_actionType]!(action, state);
    }
  }

  return state;
}
import 'package:flutter_redux_counter_app/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_counter_app/redux/reducers/reducer.dart' as Reducer;

class AppStore {
  static Store<AppState> createStore() {
    return Store<AppState>(
      Reducer.reduce,
      initialState: AppState(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_counter_app/redux/actions/counter_actions.dart';
import 'package:flutter_redux_counter_app/redux/app_store.dart';
import 'package:flutter_redux_counter_app/redux/state/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store = AppStore.createStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App with Redux'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SecondPage(),
              ),
            ),
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: StoreConnector<AppState, int>(
        converter: (store) => store.state.counterValue,
        builder: (context, value) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                value.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(AddAction());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(SubtractAction());
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, int>(
        converter: (store) => store.state.counterValue,
        builder: (context, value) =>  Center(
          child: Text(
            'Counter Value = $value',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}

import 'package:basic_provider/countercontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counterModel.dart';
import 'package:basic_provider/countercontroller.dart';

class CounterView extends StatelessWidget {
  // var title;

  const CounterView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ControllerCounter(),
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the CounterView object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<ControllerCounter>(
                builder: (_, ControllerCounter, __) => Text(
                  ControllerCounter.counter.getCounter().toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<ControllerCounter>(
          builder: (_, ControllerCounter, __) => FloatingActionButton(
            onPressed: () => ControllerCounter.increaseController(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

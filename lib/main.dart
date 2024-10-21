import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_xpage/navigation/navigation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        home: const TestPageWidget(),
      );
}

class TestPageWidget extends ElementaryWidget<TestPageWidgetModel> {
  const TestPageWidget({
    final Key? key,
    final WidgetModelFactory wmFactory = testPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(final TestPageWidgetModel wm) => Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Counter:'),
              ValueListenableBuilder<bool>(
                valueListenable: wm.calculatingState,
                builder: (final _, final bool isCalculating, final __) => isCalculating
                    ? const CircularProgressIndicator()
                    : ValueListenableBuilder<String>(
                        valueListenable: wm.valueState,
                        builder: (final _, final String value, final __) => _CounterText(
                          value: value,
                        ),
                      ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationWidget(),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: wm.calculatingState,
          builder: (final _, final bool isCalculating, final __) => isCalculating
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _IncrementButton(
                      iconData: Icons.sync_problem,
                    ),
                    SizedBox(height: 8),
                    _IncrementButton(
                      iconData: Icons.sync_problem,
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _IncrementButton(
                      onPressed: wm.increment,
                      iconData: Icons.add,
                    ),
                    const SizedBox(height: 8),
                    _IncrementButton(
                      onPressed: wm.decrement,
                      iconData: Icons.remove,
                    ),
                  ],
                ),
        ),
      );
}

TestPageWidgetModel testPageWidgetModelFactory(final BuildContext context) => TestPageWidgetModel(TestPageModel());

class TestPageWidgetModel extends WidgetModel<TestPageWidget, TestPageModel> {
  TestPageWidgetModel(super._model);

  late ValueNotifier<String> _valueController;
  late final ValueNotifier<bool> _calculatingController = ValueNotifier<bool>(false);

  ValueListenable<String> get valueState => _valueController;
  ValueListenable<bool> get calculatingState => _calculatingController;

  Future<void> increment() async {
    _calculatingController.value = true;

    final int newVal = await model.increment();
    _valueController.value = newVal.toString();

    _calculatingController.value = false;
  }

  Future<void> decrement() async {
    _calculatingController.value = true;

    final int newVal = await model.decrement();
    _valueController.value = newVal.toString();

    _calculatingController.value = false;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _valueController = ValueNotifier<String>(model.value.toString());
  }

  @override
  void dispose() {
    _valueController.dispose();
    _calculatingController.dispose();

    super.dispose();
  }
}

class TestPageModel extends ElementaryModel {
  TestPageModel();
  int _value = 0;
  int get value => _value;

  Future<int> increment() async {
    // In academic purpose emulate a process that takes some time.
    await Future<void>.delayed(const Duration(seconds: 1));

    return ++_value;
  }

  Future<int> decrement() async {
    // In academic purpose emulate a process that takes some time.
    await Future<void>.delayed(const Duration(seconds: 1));

    if (_value > 0) {
      _value--;
    }

    return _value;
  }
}

class _IncrementButton extends StatelessWidget {
  const _IncrementButton({
    required this.iconData,
    super.key,
    this.onPressed,
  });
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        child: Icon(iconData),
      );
}

class _CounterText extends StatelessWidget {
  const _CounterText({required this.value, super.key});
  final String value;

  @override
  Widget build(final BuildContext context) => Text(
        value,
        style: Theme.of(context).textTheme.headlineMedium,
      );
}

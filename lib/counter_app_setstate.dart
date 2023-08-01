import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';

class CounterAppSetState extends StatefulWidget {
  const CounterAppSetState({super.key});

  @override
  State<CounterAppSetState> createState() => _CounterAppSetStateState();
}

class _CounterAppSetStateState extends State<CounterAppSetState> {
  int counter = 1;

  @override
  void initState() {
    DMethod.printBasic('initState() - CounterAppSetState');
    super.initState();
  }

  @override
  void dispose() {
    DMethod.printBasic('dispose() - CounterAppSetState');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DMethod.printBasic('build() - CounterAppSetState');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App SetState'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton.filled(
              onPressed: () {
                counter -= 1;
                setState(() {});
              },
              icon: const Icon(Icons.remove)),
          const SizedBox(width: 20),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(width: 20),
          IconButton.filled(
              onPressed: () {
                counter += 1;
                setState(() {});
              },
              icon: const Icon(Icons.add)),
        ]),
      ),
    );
  }
}

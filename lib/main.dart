import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc()..add(LoadCounter()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The counter Bloc',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if(state is CounterInitial) {
                return const CircularProgressIndicator();
              }
              else if (state is CounterLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Счетчик:'),
                    Text('${state.counter}')

                  ],
                );
              }
              else {
                return const Text('Something went wrong!');
              }
            }
        ),
      ),
      floatingActionButton: (
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(const Increment(1));
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(const Decrement(1));
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove),
              ),
            ],
          )),
    );
  }
}


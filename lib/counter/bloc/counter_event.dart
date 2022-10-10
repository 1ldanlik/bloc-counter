part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class LoadCounter extends CounterEvent {}

class Increment extends CounterEvent {
  final int counter;

  const Increment(this.counter);

  @override
  List<Object?> get props => [counter];
}

class Decrement extends CounterEvent {
  final int counter;

  const Decrement(this.counter);

  @override
  List<Object?> get props => [counter];
}



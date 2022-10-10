part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CounterLoaded extends CounterState {
  const CounterLoaded(this.counter);
  final int counter;

  @override
  List<Object> get props => [counter];
}

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<LoadCounter>(
            (event, emit) async {
          await Future.delayed(const Duration(seconds: 1));
          emit(const CounterLoaded(0));
        }
    );
    on<Increment>(
            (event, emit) {
          if (state is CounterLoaded) {
            final state = this.state as CounterLoaded;
            emit(CounterLoaded(state.counter + event.counter));
          }
        }
    );
    on<Decrement>(
            (event, emit) {
          if (state is CounterLoaded) {
            final state = this.state as CounterLoaded;
            emit(CounterLoaded(state.counter - event.counter));
          }
        }
    );
  }
}
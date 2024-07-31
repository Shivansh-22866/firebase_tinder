import 'dart:developer';
import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('SimpleBlocObserver: ${bloc.runtimeType.toString()} created');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('SimpleBlocObserver: ${bloc.runtimeType.toString()} received event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('SimpleBlocObserver: ${bloc.runtimeType.toString()} changed to: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('SimpleBlocObserver: ${bloc.runtimeType.toString()} transitioned to: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('SimpleBlocObserver: ${bloc.runtimeType.toString()} encountered error: $error');
  }


  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('SimpleBlocObserver: ${bloc.runtimeType.toString()} closed');
  }
}

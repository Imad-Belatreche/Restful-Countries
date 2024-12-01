import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("Changed:----------");
    log("Bloc: ${bloc.runtimeType}");
    log("Change: $change");
    log("----------");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed:----------");
    log("Bloc: ${bloc.runtimeType}");
    log("----------");
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("Created:----------");
    log("Bloc: ${bloc.runtimeType}");
    log("----------");
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("Error:----------");
    log("Bloc: ${bloc.runtimeType}");
    log("Error: $error");
    log("Bloc: $stackTrace");
    log("----------");

    super.onError(bloc, error, stackTrace);
  }
}

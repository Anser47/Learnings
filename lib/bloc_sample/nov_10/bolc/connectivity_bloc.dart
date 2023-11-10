import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_learning/bloc_sample/nov_10/bolc/connectivity_event.dart';
import 'package:sample_learning/bloc_sample/nov_10/bolc/connectivity_state.dart';

class InternetBloc extends Bloc<ConnectionEvent, ConnectionStatusState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetBloc() : super(InitalConnection()) {
    on<ConnectionLossEvent>((event, emit) => emit(ConnectionLostState()));
    on<ConnectionGainedEvent>((event, emit) => emit(ConnectionGainedState()));
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(ConnectionGainedEvent());
      } else {
        add(ConnectionLossEvent());
      }
    });
  }
  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    super.close();
  }
}

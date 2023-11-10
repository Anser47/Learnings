import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_learning/bloc_sample/nov_10/bolc/connectivity_bloc.dart';
import 'package:sample_learning/bloc_sample/nov_10/bolc/connectivity_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocConsumer<InternetBloc, ConnectionStatusState>(
        listener: (context, state) {
          if (state is ConnectionGainedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'connected',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ));
          } else if (state is ConnectionLostState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'connection lost',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state is ConnectionGainedState) {
            return const Center(
              child: Text('Connected'),
            );
          } else if (state is ConnectionLostState) {
            return const Center(
              child: Text('Connection Lost'),
            );
          } else {
            return const Center(
              child: Text('Connection Lost'),
            );
          }
        },
      ),
    ));
  }
}

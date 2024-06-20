import 'dart:math';

import 'package:bloc_tutorial/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Scaffold(
      appBar: AppBar(
        title: Text("COUNTER APP - BLOC"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increment());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
             backgroundColor: Colors.green,
            foregroundColor: Colors.black,onPressed: (){
            BlocProvider.of<CounterBloc>(context).add(Decrement());
          },child: Icon(Icons.remove),)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter App",style: TextStyle(fontSize: 20),),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                print('block builder called');
                return Text('${state.count}',style: TextStyle(fontSize: 20),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

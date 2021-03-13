import 'package:l2t_alpha/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
              5, (int index) => _CounterWidget(CounterCubit())),
        ),
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  const _CounterWidget(this.cubit, {Key? key}) : super(key: key);
  final CounterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Container(
          child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: cubit.increment,
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, _) =>
                Text('${context.watch<CounterCubit>().state}'),
          ),
        ],
      )),
    );
  }
}

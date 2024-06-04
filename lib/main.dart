import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/number_series_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deret Angka',
      home: BlocProvider(
        create: (context) => NumberSeriesBloc(),
        child: NumberSeriesPage(),
      ),
    );
  }
}

class NumberSeriesPage extends StatelessWidget {
  NumberSeriesPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deret Angka'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan N',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final n = int.tryParse(_controller.text);
                        if (n != null) {
                          BlocProvider.of<NumberSeriesBloc>(context).add(GenerateSeries(n: n, seriesType: SeriesType.type1));
                        }
                      },
                      child: const Text('Type 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final n = int.tryParse(_controller.text);
                        if (n != null) {
                          BlocProvider.of<NumberSeriesBloc>(context).add(GenerateSeries(n: n, seriesType: SeriesType.type2));
                        }
                      },
                      child: const Text('Type 2'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final n = int.tryParse(_controller.text);
                        if (n != null) {
                          BlocProvider.of<NumberSeriesBloc>(context).add(GenerateSeries(n: n, seriesType: SeriesType.type3));
                        }
                      },
                      child: const Text('Type 3'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final n = int.tryParse(_controller.text);
                        if (n != null) {
                          BlocProvider.of<NumberSeriesBloc>(context).add(GenerateSeries(n: n, seriesType: SeriesType.type4));
                        }
                      },
                      child: const Text('Type 4'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                BlocBuilder<NumberSeriesBloc, NumberSeriesState>(
                  builder: (context, state) {
                    if (state is NumberSeriesInitial) {
                      return const Text('Masukkan N dan pilih tipe deret');
                    } else if (state is NumberSeriesLoaded) {
                      return Text(state.series, style: const TextStyle(fontSize: 20));
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


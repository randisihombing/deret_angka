part of 'number_series_bloc.dart';

enum SeriesType { type1, type2, type3, type4 }

abstract class NumberSeriesEvent extends Equatable {
  const NumberSeriesEvent();

  @override
  List<Object> get props => [];
}

class GenerateSeries extends NumberSeriesEvent {
  final int n;
  final SeriesType seriesType;

  const GenerateSeries({required this.n, required this.seriesType});

  @override
  List<Object> get props => [n, seriesType];
}

part of 'number_series_bloc.dart';

abstract class NumberSeriesState extends Equatable {
  const NumberSeriesState();

  @override
  List<Object> get props => [];
}

class NumberSeriesInitial extends NumberSeriesState {}

class NumberSeriesLoaded extends NumberSeriesState {
  final String series;

  const NumberSeriesLoaded({required this.series});

  @override
  List<Object> get props => [series];
}

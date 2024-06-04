import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'number_series_event.dart';
part 'number_series_state.dart';

class NumberSeriesBloc extends Bloc<NumberSeriesEvent, NumberSeriesState> {
  NumberSeriesBloc() : super(NumberSeriesInitial()) {
    on<GenerateSeries>(_onGenerateSeries);
  }

  void _onGenerateSeries(GenerateSeries event, Emitter<NumberSeriesState> emit) {
    final n = event.n;
    if (event.seriesType == SeriesType.type1) {
      emit(NumberSeriesLoaded(series: List.generate(n, (i) => i + 1).join(' ')));
    } else if (event.seriesType == SeriesType.type2) {
      emit(NumberSeriesLoaded(series: (List.generate(n, (i) => i + 1) + List.generate(n - 1, (i) => n - 1 - i)).join(' ')));
    } else if (event.seriesType == SeriesType.type3) {
      emit(NumberSeriesLoaded(series: List.generate(n, (i) => (i + 1) * 10 + i + 0).join(' ')));
    } else if (event.seriesType == SeriesType.type4) {
      emit(NumberSeriesLoaded(series: List.generate(n, (i) {
       if ((i + 1) % 5 == 0) {
          return 'LIMA';
        } else if ((i + 1) % 7 == 0) {
          return 'TUJUH';
        } else {
          return (i + 1).toString();
        }
      }).join(' ')));
    }
  }
}

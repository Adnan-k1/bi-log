import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/calculator_event.dart';
import '../state/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState(0)) {
    on<TambahEvent>((event, emit) {
      final a = int.tryParse(event.angka1) ?? 0;
      final b = int.tryParse(event.angka2) ?? 0;
      emit(CalculatorState(a + b));
    });

    on<KurangEvent>((event, emit) {
      final a = int.tryParse(event.angka1) ?? 0;
      final b = int.tryParse(event.angka2) ?? 0;
      emit(CalculatorState(a - b));
    });

    on<KaliEvent>((event, emit) {
      final a = int.tryParse(event.angka1) ?? 0;
      final b = int.tryParse(event.angka2) ?? 0;
      emit(CalculatorState(a * b));
    });

    on<BagiEvent>((event, emit) {
      final a = int.tryParse(event.angka1) ?? 0;
      final b = int.tryParse(event.angka2) ?? 1;
      emit(CalculatorState(a ~/ b));
    });
    on<ResetEvent>((event, emit) {
      emit(CalculatorState(0));
    });
  }
}

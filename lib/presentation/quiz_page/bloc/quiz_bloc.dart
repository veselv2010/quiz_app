import 'package:appfox_test_app/core/domain/models/quiz.dart';
import 'package:appfox_test_app/core/domain/models/result.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(QuizState initialState) : super(initialState) {
    on<QuizAnswerAEvent>((event, emit) {
      emit(state.getUpdatedAnswerAState(event.index, event.isRight));
    });
    on<QuizAnswerBEvent>((event, emit) {
      emit(state.getUpdatedAnswerBState(event.index, event.isRight));
    });
    on<QuizAnswerCEvent>((event, emit) {
      emit(state.getUpdatedAnswerCState(event.index, event.isRight));
    });
    on<QuizAnswerDEvent>((event, emit) {
      emit(state.getUpdatedAnswerDState(event.index, event.isRight));
    });
    on<QuizAnswerEEvent>((event, emit) {
      emit(state.getUpdatedAnswerEState(event.index, event.isRight));
    });
    on<QuizAnswerFEvent>((event, emit) {
      emit(state.getUpdatedAnswerFState(event.index, event.isRight));
    });
  }
}

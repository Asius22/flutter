import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
part 'word_pair_event.dart';
part 'word_pair_state.dart';

class WordPairBloc extends Bloc<WordPairEvent, WordPairState> {
  WordPairBloc() : super(WordPairInitial()) {
    on<WordPairEvent>((event, emit) {
      if (event.action == EventType.add) {
        emit(state.copyWith(favourites: [...state.list, event.wp]));
      } else {
        emit(state.copyWith(favourites: [...state.list]..remove(event.wp)));
      }
    });
  }
}

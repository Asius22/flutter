part of 'word_pair_bloc.dart';

enum EventType { add, remove }

class WordPairEvent extends Equatable {
  const WordPairEvent({required this.action, required this.wp});
  final EventType action;
  final WordPair wp;
  @override
  List<Object> get props => [action, wp];
}

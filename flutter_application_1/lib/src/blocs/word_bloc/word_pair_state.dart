part of 'word_pair_bloc.dart';

class WordPairState extends Equatable {
  const WordPairState({this.favourites = const <WordPair>[]});

  WordPairState copyWith({List<WordPair>? favourites}) =>
      WordPairState(favourites: favourites ?? this.favourites);

  final List<WordPair> favourites;

  bool contain(WordPair str) => favourites.contains(str);

  List<WordPair> get list => favourites;

  int get lenght => favourites.length;

  WordPair getElement(int i) => favourites[i];

  @override
  List<Object> get props => [favourites];
}

class WordPairInitial extends WordPairState {}

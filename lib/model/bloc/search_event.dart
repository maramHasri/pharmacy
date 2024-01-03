part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class Searchword extends SearchEvent {
  final String word;

  Searchword({required this.word});
}

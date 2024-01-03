part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class Loading extends SearchState {}

class LoadedWords extends SearchState {
  final List<Medicine> medicines;

  LoadedWords({required this.medicines});
}

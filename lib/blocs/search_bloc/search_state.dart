part of 'search_bloc.dart';

@immutable
abstract class SearchState<T> {}

class SearchInitialState<T> extends SearchState<T> {}

class SearchResultState<T> extends SearchState<T> {
  final Iterable<T> result;

  SearchResultState(this.result);
}

class SearchErrorState<T> extends SearchState<T> {
  final String message;

  SearchErrorState(this.message);
}

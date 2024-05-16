part of 'search_bloc.dart';

@immutable
abstract class SearchEvent<T> {}

class SearchQueryEvent<T> extends SearchEvent<T> {
  final String query;

  SearchQueryEvent(this.query);
}

class _UnknownErrorEvent<T> extends SearchEvent<T> {}

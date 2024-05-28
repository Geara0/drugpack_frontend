import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/transformers.dart';
import '../../client/dio.dart';
import 'client/search_client.dart';
import 'responses/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc<T> extends Bloc<SearchEvent<T>, SearchState<T>> {
  static final _client = SearchClient(dio);

  final String request;
  final T Function(Map<String, dynamic>) deserialize;

  Iterable<T> _searchCache = [];

  @override
  onError(error, stackTrace) {
    add(_UnknownErrorEvent());
    super.onError(error, stackTrace);
  }

  SearchBloc(
    this.request, {
    required this.deserialize,
  }) : super(SearchInitialState<T>()) {
    on<SearchQueryEvent<T>>(
      _search,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 500))
            .asyncExpand(mapper);
      },
    );
    on<_UnknownErrorEvent<T>>(_showUnknownError);
  }

  Future<void> _search(
    SearchQueryEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(SearchResultState<T>(_searchCache));
      return;
    }

    try {
      final response = await dio.post(request, data: event.query);
      final data = response.data;
      final body = SearchResponse<T>.fromJson(
        data,
            (json) => deserialize(json as Map<String, dynamic>),
      );

      _searchCache = body.result;
      emit(SearchResultState<T>(body.result));
      return;
    } catch (e, s) {
      emit(SearchResultState<T>(_searchCache));
      Error.throwWithStackTrace(e, s);
    }
  }

  void _showUnknownError(
    _UnknownErrorEvent<T> event,
    Emitter<SearchState<T>> emit,
  ) {
    emit(SearchErrorState<T>('defaultError')); //дописать ошибку
  }
}

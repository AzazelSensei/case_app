import 'package:case_app/features/reddit/data/model/reddit_model.dart';
import 'package:case_app/features/reddit/data/repository/reddit_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  final RedditRepository repository;

  RedditBloc(this.repository) : super(RedditInitial()) {
    on<RedditEvent>(_getPosts);
  }
  Future<void> _getPosts(RedditEvent event, Emitter<RedditState> emit) async {
    try {
      emit(RedditLoading());
      final redditModel = await repository.getPosts();
      emit(RedditLoaded(redditModel));
    } catch (e) {
      emit(RedditError(e.toString()));
    }
  }
}

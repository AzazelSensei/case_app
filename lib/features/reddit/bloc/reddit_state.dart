part of 'reddit_bloc.dart';

@immutable
abstract class RedditState {}

class RedditInitial extends RedditState {}

class RedditLoading extends RedditState {}

class RedditLoaded extends RedditState {
  final RedditModel redditModel;

  RedditLoaded(this.redditModel);
}

class RedditError extends RedditState {
  final String errorMessage;

  RedditError(this.errorMessage);
}

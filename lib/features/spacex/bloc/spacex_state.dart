part of 'spacex_bloc.dart';

@immutable
abstract class SpaceXState {}

class SpacexInitial extends SpaceXState {}

class SpacexLoading extends SpaceXState {}

class SpacexLoaded extends SpaceXState {
  final List<SpacexLaunches> launches;

  SpacexLoaded(this.launches);
}

class SpacexError extends SpaceXState {
  final String errorMessage;

  SpacexError(this.errorMessage);
}

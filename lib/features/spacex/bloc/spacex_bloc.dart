import 'package:case_app/features/spacex/data/model/launches_model.dart';
import 'package:case_app/features/spacex/data/repository/spacex_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpaceXBloc extends Bloc<SpacexEvent, SpaceXState> {
  final SpacexRepository repository;

  SpaceXBloc(this.repository) : super(SpacexInitial()) {
    on<GetLaunches>(_getLaunches);
  }
  Future<void> _getLaunches(
      GetLaunches event, Emitter<SpaceXState> emit) async {
    emit(SpacexLoading());
    try {
      final response = await repository.getLaunches();

      emit(SpacexLoaded(response.reversed.toList()));
    } catch (e) {
      emit(SpacexError(e.toString()));
    }
  }
}

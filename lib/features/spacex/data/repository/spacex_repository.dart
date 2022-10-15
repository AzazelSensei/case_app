
import 'package:case_app/core/network/spacex_endpoint.dart';
import 'package:case_app/features/spacex/data/model/launches_model.dart';
import 'package:dio/dio.dart';

class SpacexRepository {
  final Dio dio;

  SpacexRepository(this.dio);

  Future<List<SpacexLaunches>> getLaunches() async {
    final response = await dio.get(SpaceXEndPoint.launches);

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => SpacexLaunches.fromJson(e))
          .toList();
    } else {
      throw response.statusCode.toString();
    }
  }
}

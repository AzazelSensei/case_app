

import 'package:case_app/core/network/reddit_endpoint.dart';
import 'package:case_app/features/reddit/data/model/reddit_model.dart';
import 'package:dio/dio.dart';

class RedditRepository {
  final Dio dio;

  RedditRepository(this.dio);

  Future<RedditModel> getPosts() async {
    final response = await dio.get(
      RedditEndPoint.redditPosts,
      queryParameters: {
        'count': 20,
      },
    );

    if (response.statusCode == 200) {
      return RedditModel.fromJson(response.data);
    } else {
      throw response.statusCode.toString();
    }
  }
}

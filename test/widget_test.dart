import 'package:case_app/core/network/reddit_endpoint.dart';
import 'package:case_app/features/reddit/data/repository/reddit_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Repository Test / ',
    () {
      late RedditRepository _redditRepository;
      setUp(
        () {
          _redditRepository = RedditRepository(
              Dio(BaseOptions(baseUrl: RedditEndPoint.redditPosts)));
        },
      );

      test('GET: /get reddit request', () async {
        try {
          final response = await _redditRepository.getPosts();

          debugPrint(response.data.toString());

          expect(response.data, isNotNull);
        } catch (e) {
          debugPrint(e.toString());
        }
      });
    },
  );
}

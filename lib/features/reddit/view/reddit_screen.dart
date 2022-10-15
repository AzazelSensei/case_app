import 'package:case_app/core/widgets/custom_appbar_widget.dart';
import 'package:case_app/core/widgets/error_view.dart';
import 'package:case_app/features/reddit/bloc/reddit_bloc.dart';
import 'package:case_app/features/reddit/widget/post_body.dart';
import 'package:case_app/features/reddit/widget/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class RedditScreen extends StatefulWidget {
  const RedditScreen({super.key});

  @override
  State<RedditScreen> createState() => _RedditScreenState();
}

class _RedditScreenState extends State<RedditScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RedditBloc>().add(GetPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        displacement: 130,
        onRefresh: () async {
          context.read<RedditBloc>().add(GetPosts());
        },
        child: CustomScrollView(
          slivers: [
            CustomAppBar(context: context, title: 'Reddit Posts'),
            _bodyBuilder(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<RedditBloc, RedditState> _bodyBuilder() {
    return BlocBuilder<RedditBloc, RedditState>(
      builder: (context, state) {
        if (state is RedditLoaded) {
          return _listView(state);
        } else if (state is RedditError) {
          return ErrorView(
            state: state.errorMessage,
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  SliverList _listView(RedditLoaded state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              //POST HEADER
              PostHeader(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                subredditNamePrefixed: state.redditModel.data?.children?[index]
                        .data?.subredditNamePrefixed ??
                    '',
                author:
                    state.redditModel.data?.children![index].data?.author ?? '',
              ),

              //POST BODY
              PostBody(
                thumbnail:
                    state.redditModel.data?.children![index].data?.thumbnail ??
                        '',
                title:
                    state.redditModel.data?.children![index].data?.title ?? '',

                //DESCRIPTION APIDEN KALDIRILDIĞI İÇİN EN YAKIN KARŞILIĞI OLARAK SELFTEXT KULLANILDI
                description:
                    state.redditModel.data?.children![index].data?.selftext ??
                        '',
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ],
          );
        },
        childCount: state.redditModel.data?.children?.length ?? 0,
      ),
    );
  }
}

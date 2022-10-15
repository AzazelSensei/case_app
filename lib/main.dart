import 'package:case_app/core/constant/color_theme_constant.dart';
import 'package:case_app/core/widgets/custom_spacer.dart';
import 'package:case_app/core/widgets/main_button.dart';
import 'package:case_app/features/reddit/view/reddit_screen.dart';
import 'package:case_app/features/spacex/data/repository/spacex_repository.dart';
import 'package:case_app/core/extension/ui_extension.dart';
import 'package:case_app/features/spacex/view/spacex_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/reddit/bloc/reddit_bloc.dart';
import 'features/reddit/data/repository/reddit_repository.dart';
import 'features/spacex/bloc/spacex_bloc.dart';

void main() => runApp(MyApp(
      dio: Dio(),
    ));

class MyApp extends StatelessWidget {
  final Dio dio;

  const MyApp({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RedditBloc(RedditRepository(dio)),
        ),
        BlocProvider(
          create: (context) => SpaceXBloc(SpacexRepository(dio)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Case App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: ColorThemeConstant.greyColor,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.lowHorPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainButton(
              color: ColorThemeConstant.mainTheme,
              onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SpacexScreen(),
                    ),
                  )),
              title: 'SpaceX Case',
            ),
            const CustomSpacer(),
            MainButton(
                title: 'Reddit Case',
                onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RedditScreen(),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}

import 'package:case_app/core/constant/color_theme_constant.dart';
import 'package:case_app/core/extension/ui_extension.dart';
import 'package:case_app/core/widgets/custom_appbar_widget.dart';
import 'package:case_app/core/widgets/custom_spacer.dart';
import 'package:case_app/core/widgets/error_view.dart';
import 'package:case_app/features/spacex/bloc/spacex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpacexScreen extends StatefulWidget {
  const SpacexScreen({super.key});

  @override
  State<SpacexScreen> createState() => _SpacexScreenState();
}

class _SpacexScreenState extends State<SpacexScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SpaceXBloc>().add(GetLaunches());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeConstant.lightGrey2,
      body: RefreshIndicator(
        displacement: 150,
        onRefresh: () async {
          context.read<SpaceXBloc>().add(GetLaunches());
        },
        child: CustomScrollView(
          //BODY ITEMS
          slivers: [
            CustomAppBar(context: context, title: "SpaceX Launches"),
            _bodyBuilder(),
          ],
        ),
      ),
    );
  }

  //BODY STATE BUILDER
  BlocBuilder<SpaceXBloc, SpaceXState> _bodyBuilder() =>
      BlocBuilder<SpaceXBloc, SpaceXState>(
        builder: (context, state) {
          if (state is SpacexLoaded) {
            return _listView(state);
          } else if (state is SpacexError) {
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

  //LISTVIEW BUILDER
  SliverList _listView(SpacexLoaded state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: context.lowPadding,
            decoration: BoxDecoration(
              color: ColorThemeConstant.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: _leadingItem(context, state, index),
              title: _titleItem(state, index),
              trailing: _tailing(state, index),
            ),
          );
        },
        childCount: state.launches.length,
      ),
    );
  }

  SizedBox _tailing(SpacexLoaded state, int index) {
    return SizedBox(
      child: state.launches[index].success != null
          ? state.launches[index].success!
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : null
          : const Icon(
              Icons.cancel,
              color: Colors.red,
            ),
    );
  }

  Column _titleItem(SpacexLoaded state, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSpacer(),
        Text(
          state.launches[index].name ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const CustomSpacer(),
        Text(
          state.launches[index].details ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        const CustomSpacer(),
      ],
    );
  }

  SizedBox _leadingItem(BuildContext context, SpacexLoaded state, int index) {
    return SizedBox(
      height: context.normalWidth * 0.2,
      width: context.normalWidth * 0.2,
      child: state.launches[index].links?.patch?.small != null
          ? Center(
              child: Image.network(
                  state.launches[index].links?.patch?.small ?? ""),
            )
          : SizedBox(
              height: context.normalWidth * 0.2,
              width: context.normalWidth * 0.2,
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png")),
    );
  }
}

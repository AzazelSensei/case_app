import 'package:case_app/core/constant/color_theme_constant.dart';
import 'package:case_app/core/extension/ui_extension.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.state,
  }) : super(key: key);

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Padding(
        padding: context.lowHorPadding,
        child: Center(
          child: Text(
            state,
            style: const TextStyle(
              color: ColorThemeConstant.error,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

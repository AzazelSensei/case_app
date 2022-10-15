import 'package:case_app/core/constant/color_theme_constant.dart';
import 'package:case_app/core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.context,
    required this.title,
  }) : super(key: key);

  final BuildContext context;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      pinned: true,
      expandedHeight: 110,
      leading: const SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: context.lowHorPadding / 2.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  size: 22,
                  Icons.arrow_back_ios_new_rounded,
                  color: ColorThemeConstant.white,
                ),
              ),
              Text(title),
              const Icon(
                size: 22,
                Icons.notifications,
                color: ColorThemeConstant.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

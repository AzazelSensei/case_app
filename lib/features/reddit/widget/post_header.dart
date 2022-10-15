import 'package:case_app/core/constant/color_theme_constant.dart';
import 'package:case_app/core/widgets/custom_spacer.dart';
import 'package:case_app/core/extension/ui_extension.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.subredditNamePrefixed,
    required this.author,
    required this.color,
  });

  final String subredditNamePrefixed;
  final String author;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
          padding: context.lowHorPadding / 2,
          child: CircleAvatar(backgroundColor: color)),
      title: Text(
        subredditNamePrefixed,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        author,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorThemeConstant.mainTheme,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text("Follow"),
          ),
          const CustomSpacer(),
          const Icon(
            Icons.more_vert,
            color: ColorThemeConstant.black,
          ),
        ],
      ),
    );
  }
}

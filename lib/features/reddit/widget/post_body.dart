import 'package:case_app/core/widgets/custom_spacer.dart';
import 'package:flutter/material.dart';

class PostBody extends StatelessWidget {
  const PostBody({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.description,
  });

  final String thumbnail;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //THUMBNAIL
      leading: thumbnail == 'self'
          ? Image.network('https://www.redditstatic.com/icon.png',
              width: 60, height: 60)
          : Image.network(fit: BoxFit.fill, thumbnail, width: 60, height: 100),
      //TITLE
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),

      //DESCRIPTION APIDEN KALDIRILDIĞI İÇİN EN YAKIN KARŞILIĞI OLARAK SELFTEXT KULLANILDI
      subtitle: Column(
        children: [
          const CustomSpacer(),
          Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          const CustomSpacer(),
        ],
      ),
    );
  }
}

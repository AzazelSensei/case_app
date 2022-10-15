import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.color,
    this.onPressed,
    required this.title,
  });

  final void Function()? onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(80),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .button
            ?.copyWith(color: Colors.white, fontSize: 30),
      ),
    );
  }
}

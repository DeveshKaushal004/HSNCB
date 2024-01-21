import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool automaticallyImplyLeading;
  final bool alignTitleLeft; // New property to align the title to the left

  CommonAppBar({
    required this.title,
    this.backgroundColor = Colors.black87,
    this.foregroundColor = Colors.amberAccent,
    this.automaticallyImplyLeading = true,
    this.alignTitleLeft = false, // Default is false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        alignment: alignTitleLeft ? Alignment.centerLeft : Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      elevation: 1.1,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

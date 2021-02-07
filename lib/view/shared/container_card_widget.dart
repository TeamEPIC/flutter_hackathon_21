import 'package:flutter/material.dart';

class ContainerCardWidget extends StatelessWidget {
  const ContainerCardWidget({Key key, @required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark ?? false;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: isDarkMode ? 1 : 5,
              offset: Offset.zero,
            ),
          ],
        ),
        child: child);
  }
}

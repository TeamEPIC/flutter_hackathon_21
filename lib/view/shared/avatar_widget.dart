import 'dart:math';

import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget(this.letter, {Key key}) : super(key: key);

  final String letter;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 40,
          width: 40,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          child: Center(child: Text('${(letter[0]).toUpperCase()}')),
        ));
  }
}

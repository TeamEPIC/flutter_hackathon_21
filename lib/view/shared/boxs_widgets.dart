import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/core/providers/boxs_api_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class UserBoxWidget extends StatelessWidget {
  final Widget child;
  final Widget Function(BuildContext context, UserHiveObject user, Widget child)
      builder;

  const UserBoxWidget({Key key, this.child, @required this.builder})
      : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read(UserBoxApiProvider.provider);

    return ValueListenableBuilder<Box<UserHiveObject>>(
      valueListenable: provider.listenable,
      child: child,
      builder: (context, box, child) => box.isNotEmpty
          ? builder?.call(context, box.values?.first, child)
          : Text('Kullanici kaydi bulunamadi :/'),
    );
  }
}

class BulletinsBoxWidget extends StatelessWidget {
  final Widget child;
  final Widget Function(BuildContext context,
      List<BulletinHiveObject> bulletions, Widget child) builder;

  const BulletinsBoxWidget({Key key, this.child, @required this.builder})
      : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read(BulletinsBoxApiProvider.provider);

    return ValueListenableBuilder<Box<BulletinHiveObject>>(
      valueListenable: provider.listenable,
      child: child,
      builder: (context, box, child) => box.isNotEmpty
          ? builder?.call(context, box.values.toList(), child)
          : Text('ilan kaydi bulunamadi :/'),
    );
  }
}

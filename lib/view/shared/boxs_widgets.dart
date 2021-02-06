import 'package:flutter/material.dart';
import 'file:///C:/Users/cihan/FlutterProjects/flutter_hackathon_21/lib/core/providers/boxs_api_providers.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class BulletionsBoxTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        BulletinsBoxWidget(builder: (context, bulletins, child) {
          return Text('$bulletins');
        }),
        RaisedButton(onPressed: () {
          final newUSer = UserHiveObject(
              age: 18,
              name: 'asdqdwe',
              bio: 'asdsad',
              city: 'asdsa',
              mail: 'asdsa',
              phone: 'asdsad');

          final bulletin = BulletinHiveObject(
              user: newUSer,
              title: 'asd',
              additional: 'asdsasd',
              content: 'asdsad',
              type: BulletinType.book);

          context.read(BulletinsBoxApiProvider.provider).create(bulletin);
        }),
        RaisedButton(
          onPressed: () {
            context.read(BulletinsBoxApiProvider.provider).clearAll();
          },
          child: Text('Clear'),
        )
      ],
    ));
  }
}

class UserBoxTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          UserBoxWidget(
            builder: (context, user, child) => Text('${user}'),
          ),
          RaisedButton(onPressed: () {
            final newUSer = UserHiveObject(
                age: 18,
                name: 'cihan',
                bio: 'asdsad',
                city: 'asdsa',
                mail: 'asdsa',
                phone: 'asdsad');

            context.read(UserBoxApiProvider.provider).create(newUSer);
          }),
          RaisedButton(
            onPressed: () {
              context.read(UserBoxApiProvider.provider).clearAll();
            },
            child: Text('Clear'),
          )
        ],
      ),
    );
  }
}

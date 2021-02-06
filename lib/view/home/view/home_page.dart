import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/page_consts/page_const.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/view/shared/boxs_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: const Text('App Name'),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.person), onPressed: () {})],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: BulletinsBoxWidget(
        builder: (context, bulletins, child) {
          return ListView.builder(
              itemCount: bulletins.length,
              itemBuilder: (context, index) {
                final bulletin = bulletins[index];
                return BulletinListTile(bulletin);
              });
        },
      ),
    );
  }
}

class BulletinListTile extends StatelessWidget {
  const BulletinListTile(this.bulletin, {Key key}) : super(key: key);
  final BulletinHiveObject bulletin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Theme.of(context).accentColor,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${bulletin.title}',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${bulletin.additional}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        'https://i.pravatar.cc/150?img=${bulletin.user.age}',
                        width: 80,
                      ))
                ],
              ),
              Divider(),
              Row(
                children: [
                  LocationChip(),
                  Spacer(),
                  BulletinTypeWidget(bulletin.type),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BulletinTypeWidget extends StatelessWidget {
  final BulletinType type;

  const BulletinTypeWidget(
    this.type, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Icon(_icon),
    );
  }

  IconData get _icon {
    switch (type) {
      case BulletinType.student:
        return Icons.child_care;
      case BulletinType.mentor:
        return Icons.school_outlined;
      case BulletinType.book:
        return Icons.book;
      default:
        return Icons.book;
    }
  }
}

class LocationChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        shadowColor: Theme.of(context).accentColor,
        elevation: 4,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.map), SizedBox(width: 8), Text('Antalya')],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/view/home/profile/profile_dialog.dart';
import 'package:flutter_hackathon_21/view/shared/avatar_widget.dart';
import 'package:flutter_hackathon_21/view/shared/boxs_widgets.dart';
import 'package:flutter_hackathon_21/view/shared/container_card_widget.dart';
import 'package:intl/intl.dart';

class BulletinListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BulletinsBoxWidget(
      builder: (context, bulletins, child) {
        bulletins.sort((a, b) => b.createdTme.compareTo(a.createdTme));

        return ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: bulletins.length,
            itemBuilder: (context, index) {
              final bulletin = bulletins[index];
              return BulletinListTileWidget(bulletin: bulletin);
            });
      },
    );
  }
}

class BulletinListTileWidget extends StatelessWidget {
  const BulletinListTileWidget({Key key, this.bulletin}) : super(key: key);
  final BulletinHiveObject bulletin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ContainerCardWidget(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                child: ProfileDialog(bulletin.user));
                          },
                          child: AvatarWidget(bulletin.user.name),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${bulletin.user.name}'),
                          SizedBox(height: 4),
                          BulletinCreatedDateLabel(bulletin.createdTme)
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BulletinTypeWidget(bulletin.type),
                          LocationLabel(bulletin.user.city)
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${bulletin.title}',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${bulletin.additional}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  ContentChip(bulletin.content),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        width: 36,
                        height: 36,
                        child: IconButton(
                          icon: Icon(Icons.mail),
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Mail Aksiyonu')));
                          },
                          iconSize: 18,
                        )),
                  ),
                  SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                        color: Theme.of(context).accentColor.withOpacity(0.1),
                        width: 36,
                        height: 36,
                        child: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Arama Aksiyonu')));
                          },
                          iconSize: 18,
                        )),
                  )
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
    return Opacity(
      opacity: 0.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(_icon, size: 32),
      ),
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

class ContentChip extends StatelessWidget {
  final String text;

  const ContentChip(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Icon(Icons.science),
      ),
      label: Text(text),
      padding: const EdgeInsets.all(4),
    );
  }
}

class LocationLabel extends StatelessWidget {
  const LocationLabel(this.location, {Key key}) : super(key: key);
  final String location;

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.8,
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
          child: Text(location, style: TextStyle(fontSize: 12)),
        ));
  }
}

class BulletinCreatedDateLabel extends StatelessWidget {
  const BulletinCreatedDateLabel(this.createdTime, {Key key}) : super(key: key);
  final DateTime createdTime;

  @override
  Widget build(BuildContext context) => Opacity(
      opacity: 0.5, child: Text(_parsed, style: TextStyle(fontSize: 11)));

  String get _parsed {
    final format = DateFormat('dd.MM.yyyy');
    return format.format(createdTime);
  }
}

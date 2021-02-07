import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/view/shared/avatar_widget.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog(this.user, {Key key}) : super(key: key);
  final UserHiveObject user;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AvatarWidget(user.name),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.name}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Opacity(
                            opacity: 0.8,
                            child: Text(
                              '${user.bio}',
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              leading: Icon(Icons.cake),
              title: Text('${user.age}'),
              trailing: Text('yasinda', style: TextStyle(fontSize: 12)),
            ),
            Divider(height: 0),
            ListTile(
              dense: true,
              leading: Icon(Icons.map),
              title: Text('${user.city}'),
              trailing: Text('yasiyor', style: TextStyle(fontSize: 12)),
            ),
            Divider(height: 0),
            ListTile(
              dense: true,
              leading: Icon(Icons.mail),
              title: Text('${user.mail}'),
              trailing: Icon(Icons.navigate_next),
            ),
            Divider(height: 0),
            ListTile(
              dense: true,
              leading: Icon(Icons.phone),
              title: Text('${user.phone}'),
              trailing: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}

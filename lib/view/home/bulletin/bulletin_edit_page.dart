import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/core/providers/boxs_api_providers.dart';
import 'package:flutter_hackathon_21/view/shared/container_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BulletinCreatePage extends StatefulWidget {
  const BulletinCreatePage({Key key, this.bulletin, @required this.user})
      : super(key: key);
  final BulletinHiveObject bulletin;
  final UserHiveObject user;

  @override
  _BulletinCreatePageState createState() => _BulletinCreatePageState();
}

class _BulletinCreatePageState extends State<BulletinCreatePage> {
  BulletinHiveObject _bulletin;
  var toggleButtonsState = <bool>[true, false, false];

  @override
  void initState() {
    super.initState();
    _bulletin = widget.bulletin ??
        BulletinHiveObject(
            title: '',
            additional: '',
            content: '',
            type: BulletinType.student,
            user: context.read(UserBoxApiProvider.provider).user,
            createdTme: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulettinAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _bulletin.createdTme = DateTime.now();
          await context
              .read(BulletinsBoxApiProvider.provider)
              .create(_bulletin);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
      body: bulletinListView,
    );
  }

  AppBar bulettinAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(_appBarTitle),
    );
  }

  String get _appBarTitle =>
      widget.bulletin == null ? 'Yeni İlan' : 'İlani Düzenle';

  Widget get bulletinListView => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 8),
              ContainerCardWidget(
                child: ListTile(
                  title: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.title),
                        labelText: 'Baslik'),
                    onChanged: (value) {
                      setState(() {
                        _bulletin.title = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              ContainerCardWidget(
                child: ListTile(
                  title: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.subtitles),
                          labelText: 'Açiklama',
                          hintText: 'İlan detayini giriniz'),
                      onChanged: (value) => _bulletin.additional = value),
                ),
              ),
              SizedBox(height: 16),
              ContainerCardWidget(
                child: ListTile(
                  title: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.tag),
                          labelText: 'Konu'),
                      onChanged: (value) => _bulletin.content = value),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: ToggleButtons(
                    borderRadius: BorderRadius.circular(8),
                    onPressed: (index) {
                      setState(() {
                        for (var buttonIndex = 0;
                            buttonIndex < toggleButtonsState.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            toggleButtonsState[buttonIndex] = true;
                          } else {
                            toggleButtonsState[buttonIndex] = false;
                          }
                        }
                      });
                      _bulletin.type = BulletinType.values[index];
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.child_care),
                            SizedBox(width: 4),
                            Text(AppConstants.OGRENCI)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.school_outlined),
                            SizedBox(width: 4),
                            Text(AppConstants.MENTOR)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.book),
                            SizedBox(width: 4),
                            Text(AppConstants.BAGIS)
                          ],
                        ),
                      )
                    ],
                    isSelected: toggleButtonsState),
              )
            ],
          ),
        ),
      );
}

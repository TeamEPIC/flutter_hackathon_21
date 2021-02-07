import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/core/providers/boxs_api_providers.dart';
import 'package:flutter_hackathon_21/view/shared/container_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final user = UserHiveObject(
      name: '',
      bio: '',
      age: 32,
      city: 'Istanbul',
      mail: 'mail@gmail.com',
      phone: '+90 532 270 9042');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read(UserBoxApiProvider.provider).create(user);
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.navigate_next),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'assets/logo.png',
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ContainerCardWidget(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.title),
                                labelText: 'Isim'),
                            onChanged: (value) {
                              user.name = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.title),
                                labelText: 'Bio'),
                            onChanged: (value) {
                              user.bio = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.mail),
                                labelText: 'Mail'),
                            onChanged: (value) {
                              user.mail = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.map),
                                labelText: 'Sehir'),
                            onChanged: (value) {
                              user.city = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.phone),
                                labelText: 'Telefon'),
                            onChanged: (value) {
                              user.phone = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.cake), labelText: 'Yas'),
                            onChanged: (value) {
                              user.age = int.parse(value);
                            },
                          ),
                        ),
                        SizedBox(height: 8)
                      ],
                    ),
                  ),
                ),
              ),
              Builder(
                  builder: (context) => FlatButton.icon(
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Gizlilik Sozlesmesi Aksiyonu')));
                      },
                      icon: Icon(Icons.notes),
                      label: Text('Gizlilik Sozlesmesi')))
            ],
          ),
        ),
      ),
    );
  }
}

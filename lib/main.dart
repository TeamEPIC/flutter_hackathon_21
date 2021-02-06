import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => debugPrint('${record.loggerName} : ${record.message}'));

  await Hive.initFlutter();

  Hive.registerAdapter(BulletinTypeAdapter());
  Hive.registerAdapter(BulletinHiveObjectAdapter());
  Hive.registerAdapter(UserHiveObjectAdapter());

  await Hive.openBox<dynamic>('user');
  await Hive.openBox<dynamic>('bulletins');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(body: Center(child: Text('hello world'))),
    );
  }
}

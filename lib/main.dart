import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/core/providers/boxs_api_providers.dart';
import 'package:flutter_hackathon_21/core/setup.dart';
import 'package:flutter_hackathon_21/view/home/view/home_page.dart';
import 'package:flutter_hackathon_21/view/shared/boxs_widgets.dart';
import 'package:flutter_hackathon_21/view/shared/register_state_consumer_widgetbuilder.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveSetup();
  loggerSetup();
  runApp(ProviderScope(child: MyApp()));
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
          accentColor: Colors.lightGreen),
      // darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class _TitledTestWidget extends StatelessWidget {
  const _TitledTestWidget(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('$title'),
      ),
    );
  }
}

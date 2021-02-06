import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/init/navigation/navigation_route.dart';
import 'package:flutter_hackathon_21/core/init/navigation/navigation_service.dart';
import 'package:flutter_hackathon_21/view/authentication/auth/login/login_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
      (record) => debugPrint('${record.loggerName} : ${record.message}'));

  await Hive.initFlutter();
  await Hive.openBox<dynamic>('settings');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      title: AppConstants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //darkTheme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}

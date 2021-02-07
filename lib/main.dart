import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/setup.dart';
import 'package:flutter_hackathon_21/view/home/home_screen.dart';
import 'package:flutter_hackathon_21/view/register/register_screen.dart';
import 'package:flutter_hackathon_21/view/register/register_state_consumer_widgetbuilder.dart';
import 'package:flutter_hackathon_21/view/register/splash_screen.dart';
import 'package:flutter_riverpod/all.dart';

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
      title: AppConstants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.grey.shade300,
        cardColor: Colors.grey.shade300,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //darkTheme: ThemeData.dark().copyWith(accentColor: Colors.lightGreen),
      home: RegisterStateConsumerWidgetBuilder(
        homeWidgetBuilder: (_) => HomeScreen(),
        loadingWidgetBuilder: (_) => SplashScreen(),
        registerWidgetBuilder: (_) => RegisterScreen(),
      ),
    );
  }
}

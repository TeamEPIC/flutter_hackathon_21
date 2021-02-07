import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [buildLotie, welcomeText(context)],
        ),
      );

  Widget get buildLotie =>
      Lottie.asset(AppConstants.LOTTIE_SPLASH, controller: _controller,
          onLoaded: (composition) async {
        _controller
          ..duration = composition.duration
          ..forward();
      });

  Widget welcomeText(BuildContext context) => Center(
      child:
          Text(AppConstants.WELCOME_TEXT, style: context.textTheme.headline3));
}

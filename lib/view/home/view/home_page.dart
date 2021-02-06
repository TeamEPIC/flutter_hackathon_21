import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/constants/page_consts/page_const.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(PageConstants.HOME_PAGE)),
    );
  }
}

import 'package:davi_project/components/title.dart';
import 'package:flutter/material.dart';

import '../components/navigator.dart';

class Bengala extends StatelessWidget {
  const Bengala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title(),
              NavigatorMenu(),
            ],

          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class title extends StatelessWidget {
  const title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 5),
      child: Container(
        height: 50,
        width: 150,
        child: Text('D.A.V.I', textAlign: TextAlign.center, style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
          fontSize: 40,
        ),),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'InfoText.dart';

class bengalaComponente extends StatefulWidget {
  const bengalaComponente({Key? key}) : super(key: key);

  @override
  State<bengalaComponente> createState() => _bengalaComponenteState();
}

class _bengalaComponenteState extends State<bengalaComponente> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Informações da Bengala',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          textInformation('Bateria','100'),
          textInformation('Volume','Ligado'),
        ],

      ),
    );
  }
}

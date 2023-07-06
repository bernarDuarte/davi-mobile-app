import 'package:davi_project/components/textImg.dart';
import 'package:flutter/material.dart';

class Rota extends StatefulWidget {
  const Rota({Key? key}) : super(key: key);

  @override
  State<Rota> createState() => _RotaState();
}

class _RotaState extends State<Rota> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // NavigatorMenu(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Informe a Rota',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          textInformationImg('Destino','assets/images/microfone-gravador.png'),
        ],

      ),
    );
  }
}

import 'package:flutter/material.dart';

class textInformation extends StatefulWidget {

  final String textInfo;
  final String value;

  const textInformation(this.textInfo,this.value ,{Key? key}) : super(key: key);

  @override
  State<textInformation> createState() => _textInformationState();
}

class _textInformationState extends State<textInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 0, vertical: 0),
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: Color(0xFF000000), width: 2),
                left: BorderSide(color: Color(0xFF000000), width: 2),
                right: BorderSide(color: Color(0xFF000000), width: 2),
                bottom: BorderSide(color: Color(0xFF000000), width: 2),
              ),
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(16)
            ),
          ),
          height: 80,
          width: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.white, width: 150, height: 60,
                      child: Text(widget.textInfo, style: TextStyle( fontSize: 40,fontWeight: FontWeight.w400 ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.white, width: 130, height: 60, child: Text(widget.value, style: TextStyle( fontSize: 35, fontWeight: FontWeight.w400), textAlign: TextAlign.end,)),
                  )
                ]
              ),

            ],
          ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text('Bateria'),
      //         Text('100%')
      //       ],
      //      ),
      //   ],
      ),
    );
  }
}

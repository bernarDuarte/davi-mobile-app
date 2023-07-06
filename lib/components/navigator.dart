import 'package:davi_project/components/bengala.dart';
import 'package:davi_project/components/rota.dart';
import 'package:flutter/material.dart';



class NavigatorMenu extends StatefulWidget {
  const NavigatorMenu({Key? key}) : super(key: key);
  @override
  State<NavigatorMenu> createState() => _NavigatorMenuState();
}

class _NavigatorMenuState extends State<NavigatorMenu> {
  bool rota = true;
  int bengalaSize =0;
  int rotaSize =0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFF000000), width: 2),
                          left: BorderSide(color: Color(0xFF000000), width: 0),
                          right: BorderSide(color: Color(0xFF000000), width: 2),
                          bottom: BorderSide(color: Color(0xFF000000), width: 3),
                        ),
                        color: Color(0xFFFFFFFF),
                      ),
                      height: 80,
                      width: 187,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:new  BorderSide(color: Color(0xFFFFFFFF)), //the outline color
                            borderRadius: new BorderRadius.all(new Radius.circular(0))),
                        onPressed: (){
                          setState(() {
                            rota = true;
                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (conxtet)=> Rota()));
                        },
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/route.png', fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFF000000), width: 2),
                          left: BorderSide(color: Color(0xFF000000), width: 2),
                          right: BorderSide(color: Color(0xFF000000), width: 0),
                          bottom:
                          BorderSide(color: Color(0xFF000000), width: 3),
                        ),
                        color: Color(0xFFFFFFFF),
                      ),
                      height: 80,
                      width: 187,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side:new  BorderSide(color: Color(0xFFFFFFFF)), //the outline color
                            borderRadius: new BorderRadius.all(new Radius.circular(0))),
                        onPressed: (){
                          setState(() {
                            rota = false;
                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (conxtet)=> Rota()));
                        },
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/bengala.png', fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(child: Rota(), visible: rota,),
                Visibility(child: bengalaComponente(), visible: !rota,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

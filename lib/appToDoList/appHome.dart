// import 'package:davi_project/appToDoList/inherited.dart';
// import 'package:davi_project/screens/home.dart';
// import 'package:davi_project/screens/rotaScreen.dart';
// import 'package:flutter/material.dart';
//
// import 'footer.dart';
// import '../components/navigator.dart';
// import '../components/task.dart';
// import '../screens/formScreen.dart';
//
// class AppHome extends StatefulWidget {
//   const AppHome({Key? key}) : super(key: key);
//
//   @override
//   State<AppHome> createState() => _AppHomeState();
// class _AppHomeState extends State<AppHome> {
//
//   // AppHome@override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         centerTitle: true,
//         title: const Text('Tarefas'),
//       ),
//       body: ListView(
//         children: TaskInherited.of(context).taskList,
//         // const [
//         //
//         // // NavigatorMenu(),
//         // SizedBox(height: 40),
//         // ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               // builder: (contextNew) => FormScreen(taskContext: context),
//               builder: (contextNew) => Bengala(),
//             ),
//           );
//         },
//         // child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
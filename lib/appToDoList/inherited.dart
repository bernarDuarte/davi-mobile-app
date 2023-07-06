// import 'package:flutter/cupertino.dart';
//
// import '../components/task.dart';
//
// class TaskInherited extends InheritedWidget {
//   TaskInherited({
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   final List<Task> taskList = [
//     Task('terminar opentelemetry', 'assets/images/flutter.png', 3),
//     Task('andar','assets/images/livro.jpg',1),
//     Task('Ler','assets/images/livro.jpg',3),
//     Task('Jogar','assets/images/game.jpg',1),
//     Task('meditar','assets/images/meditar.jpeg',1),
//   ];
//
//   final List<Widget> task = [];
//
//   void newWidget(Widget tela){tela
//     task.clear();
//     task.add(tela);
//   }
//
//   void newTask(String name, String photo, int difficulty ){
//     taskList.clear();
//     taskList.add(Task(name, photo, difficulty));
//   }
//   static TaskInherited of(BuildContext context) {
//     final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
//     assert(result != null, 'No TaskInhe found in context');
//     return result!;
//   }
//
//   @override
//   bool updateShouldNotify(TaskInherited oldWidget) {
//     return oldWidget.taskList.length != taskList.length;
//   }
// }

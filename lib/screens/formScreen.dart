import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);
  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            title:  const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              height: 650,
              width: 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (String? value){
                        if(value != null && value.isEmpty ){
                          return 'Insira o nome da tarefa!';
                        }
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome',
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (String? value){
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5!';
                        }
                      },
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Difficulty',
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: (text){
                        setState(() {

                        });
                      },
                      validator: (String? value){
                        if(value!.isEmpty ){
                          return 'Insira o nome da tarefa!';
                        }
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'image',
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),

                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        errorBuilder: (BuildContext context,Object exception, StackTrace? stackTrace){
                          return Container();
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if( _formKey.currentState!.validate()){
                        // print(nameController.text);
                        // print(int.parse(difficultyController.text));
                        // print(imageController.text);]
                        //   TaskInherited.of(widget.taskContext).newTask(nameController.text, imageController.text, int.parse(difficultyController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Criando nova Tarefa'),
                          ),
                        );
                        Navigator.pop(widget.taskContext);
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ] ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

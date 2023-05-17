import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomePageStateClass();
  }
}

class _HomePageStateClass extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  //Por esto es clase Stateful
  String? _newTaskContent;
  Box? _box;

  _HomePageStateClass();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    print("Input Value: $_newTaskContent");

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          "Taskly!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: _taskView(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskView() {
    // Hive.openBox('nombre_box') abre un contenedor donde ponemos
    // los datos que neceistamos guardar, podemos abrir muchas boxes
    // Es una future function (async | await no funciona porque es de UI)

    return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (
        BuildContext _context,
        AsyncSnapshot _snapshot,
      ) {
        if (_snapshot.hasData) {
          // Guarda en box lo que hay adentro de 'tasks'
          _box = _snapshot.data;
          return _tasksList();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _tasksList() {
    //Task _newTask =
    //    Task(content: "Go to Gym", timestamp: DateTime.now(), done: false); // Guarda en lla box esos valores
    // _box?.add(_newTask.toMap()); // ? Si box no existe, no corre esta linea

    List tasks = _box!.values.toList(); // ! Null safety
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext _context, int _index) {
        var task = Task.fromMap(tasks[_index]);
        return ListTile(
          title: Text(
            task.content.toString(),
            style: TextStyle(
              decoration: task.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.timestamp.toString()),
          trailing: Icon(
            task.done
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined,
            color: Colors.red,
          ),
          onTap: () {
            setState(() {
              task.done = !task.done; // Si es true se vuelve false y biseversa
              _box!.putAt(
                _index,
                task.toMap(),
              );
            });
          },
          onLongPress: () {
            _box!.deleteAt(_index);
            setState(() {});
          },
        );
      },
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      child: Icon(Icons.add),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: const Text("Add New Task!"),
          content: TextField(
            // on submited es cuando se pulsa el check en el teclado
            onSubmitted: (_) {
              // Guarda en la base de datos (Hive desde _box) la nueva task escrita
              if (_newTaskContent != null) {
                var _task = Task(
                  content: _newTaskContent!,
                  timestamp: DateTime.now(),
                  done: false,
                );
                _box!.add(_task.toMap());
                setState(() {
                  _newTaskContent = null;
                  Navigator.pop(
                      context); //Cierra la alert sin necesidad de hacer click fuera de ella
                });
              }
            },
            onChanged: (_value) {
              // Esta es la manera correcta de guardar un valor,
              // cada que cambia el contenido del TexField se manda
              //llamar la funcion build, por eso se imprime cada que se ingresa una letra
              setState(() {
                _newTaskContent = _value;
                if (_newTaskContent == '') {
                  _newTaskContent = null;
                }
              });
            },
          ),
        );
      },
    );
  }
}

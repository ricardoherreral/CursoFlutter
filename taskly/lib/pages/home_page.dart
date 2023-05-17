import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomePageStateClass();
  }
}

class _HomePageStateClass extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  _HomePageStateClass();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

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
      body: _tasksList(),
      floatingActionButton: _addTaskButton(),
    );
  }
}

Widget _tasksList() {
  return ListView(
    children: [
      ListTile(
        title: const Text(
          "Do Laundry!",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        subtitle: Text(DateTime.now().toString()),
        trailing: const Icon(
          Icons.check_box_outlined,
          color: Colors.red,
        ),
      )
    ],
  );
}

Widget _addTaskButton() {
  return FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  );
}

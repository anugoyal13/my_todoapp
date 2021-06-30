import 'package:flutter/material.dart';


class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  final List<String> todoList = <String>[];


  final TextEditingController textFieldController = TextEditingController();
  @override



  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Container(
            height:ScreenHeight*0.3 ,
            width: ScreenWidth,
            child: Image.network("https://i.imgur.com/OvMZBs9.jpg",fit: BoxFit.fill,),
          ),
          ListView(
              shrinkWrap: true,
              children: getItems()
          ),

        ],
      ),


      floatingActionButton: FloatingActionButton(
          onPressed: () => displayDialog(context),
          tooltip: "Add ToDo",
          backgroundColor: Colors.black,
          child: const Icon(Icons.add)),
    );
  }

  void addTodoItem(String title) {
    setState(() {
      todoList.add(title);
    });
    textFieldController.clear();
  }


  Widget buildTodoItem(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 15,
        color: Colors.white,
        shadowColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
            title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            trailing:InkWell(
                onTap: (){
                  todoList.remove(title);
                  setState(() {

                  });
                },
                child: Icon(Icons.delete)
            )
        ),
      ),
    );
  }


  Future<AlertDialog> displayDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add a task to your list"),
            content: TextField(
              controller: textFieldController,
              decoration: const InputDecoration(hintText: "Enter task here"),
            ),

            actions: <Widget>[
              // add button
              MaterialButton(
                child: const Text("ADD"),
                onPressed: () {
                  Navigator.of(context).pop();
                  addTodoItem(textFieldController.text);
                },
              ),
              // Cancel button
              MaterialButton(
                child: const Text("CANCEL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }


  List<Widget> getItems() {
    final List<Widget> todoWidgets = <Widget>[];
    for (String title in todoList) {
      todoWidgets.add(buildTodoItem(title));
    }
    return todoWidgets;
  }
}
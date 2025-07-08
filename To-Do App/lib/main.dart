import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 244, 154, 44),
          title: Text(
            "To-Do App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(child: ToDoApp()),
      ),
    ),
  );
}

class ToDoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToDoAppState();
  }
}

class ToDoAppState extends State<ToDoApp> {
  TextEditingController textEditingController = TextEditingController();
  List<Task> allTask = [];
  String allTaskKey="allTaskKey";
  
  @override
  void initState(){
    super.initState();
    setState(() {
      loadTask();
    });
  }

 void loadTask() async{
  final pref=await SharedPreferences.getInstance();
  List<String>? getData=pref.getStringList(allTaskKey);
  if(getData!=null){
    allTask=getData.cast<Task>();
  }
 }

  //save allTask array in shared preferences
  void saveTask() async 
  {
    final pref=await SharedPreferences.getInstance();
    pref.setStringList(allTaskKey,allTask.cast<String>());
  }

  addTask() {
    setState(() {
      allTask.add(Task("",textEditingController.text,false));
    });
    saveTask();
  }

  delTask(int index) {
    setState(() {
      allTask.removeAt(index);
    });
    saveTask();
  }

  doneTask(int index){
    setState(() {
    
  });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allTask.length,
              itemBuilder: (context, index) {
                return taskCard(index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              color: Color.fromARGB(255, 244, 154, 44),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
            
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: "Enter Task",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 244, 154, 44)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(5),
                      backgroundColor: Colors.amberAccent,
                    ),
                    onPressed: addTask,
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget taskCard(int index) {
    return Card(
      elevation:3,
      margin:EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      color: Color.fromARGB(255, 244, 154, 44),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Checkbox(value: allTask[index].isDone, onChanged: (bool? value) {
            setState(() {
              allTask[index].isDone=allTask[index].isDone? false:true;
            });
          }),
            Text(allTask[index].task,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            ElevatedButton(onPressed: ()=>delTask(index), child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}

class Task{
  String id="1";
  String task="";
  bool isDone=false;
  Task(String id,String task,bool isDone){
    this.id=id;
    this.task=task;
    this.isDone=isDone;
  }
}

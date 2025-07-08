import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemo/ListProvider.dart';
import 'package:statemanagementdemo/SecondScreen.dart';

class Firstscreen extends StatefulWidget {
  @override
  State<Firstscreen> createState() {
    return FirstscreenState();
  }
}

class FirstscreenState extends State<Firstscreen> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, NumberListProvider nlp, Widget? child )=>
     Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        nlp.add();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text(
            nlp.number.last.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nlp.number.length,
              itemBuilder:
                  (context, index) => Text(
                    nlp.number[index].toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Secondscreen(),
                ),
              );
            },
            child: Text("Move to Next Screen"),
          ),
        ],
      ),
    )
    );
  }
}

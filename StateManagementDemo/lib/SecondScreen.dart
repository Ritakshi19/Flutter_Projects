import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemo/ListProvider.dart';
import 'package:statemanagementdemo/ThirdScreen.dart';

class Secondscreen extends StatefulWidget {
 
  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
   Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, NumberListProvider nlp, Widget? child )=> 
    Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
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
                  builder: (context) => ThirdScreen(),
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
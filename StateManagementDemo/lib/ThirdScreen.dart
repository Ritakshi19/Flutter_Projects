import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemo/ListProvider.dart';


class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() {
    return ThirdScreenState();
  }
}

class ThirdScreenState extends State<ThirdScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, NumberListProvider nlp, Widget? child )=>
     Scaffold(
      appBar: AppBar(title: Text("Third Screen")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        nlp.multiply();
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
        ],
      ),
    )
    );
  }
}

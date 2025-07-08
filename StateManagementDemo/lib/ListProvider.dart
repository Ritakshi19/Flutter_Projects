import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier{
  List<int> number = [1,2,3,4];
  void add(){
    number.add(number.last+1);
    notifyListeners();
  }

  void multiply(){
    number = number.map((num) => num * 5).toList();
    notifyListeners();
  }


  
}


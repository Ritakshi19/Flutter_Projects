import 'package:flutter/material.dart';

class Explicitanimationdemo extends StatefulWidget{
  @override
  State<Explicitanimationdemo> createState() => _ExplicitanimationdemoState();
}

class _ExplicitanimationdemoState extends State<Explicitanimationdemo> with SingleTickerProviderStateMixin{
  late AnimationController animationController ;
  late Animation animation;
  late Animation animation1;
   void initState(){
  super.initState();
  animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
  animation=Tween(begin: 80.0, end: 200.0).animate(animationController);
  animation1=ColorTween(begin: Colors.amber,end: Colors.red).animate(animationController);

  animationController.addListener((){
    print(animation.value);
    setState(() {
      
    });

  });
  animationController.forward();
}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: animation1.value,
        width:animation.value,
        height: animation.value,
        
      ),
    );
  }
}
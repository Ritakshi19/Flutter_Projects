import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}
class _CartState extends State<Cart> {
  bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        
        onTap: () {
          setState(() {
          isExpanded =!isExpanded;   
          });
        },
        child: AnimatedContainer(
          width: isExpanded? 200:80,
          height: 60,
          decoration: BoxDecoration(
            color: isExpanded?Colors.green: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          duration: Duration(seconds: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isExpanded?Icons.check:Icons.shopping_cart),
              if(isExpanded) Text(" Added to Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
            ],
          ),
        ),
      ),
    );
  }
}

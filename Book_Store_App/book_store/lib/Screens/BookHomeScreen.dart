import 'package:book_store_app/Models/Book.dart';
import 'package:book_store_app/Screens/BookAddScreen.dart';
import 'package:book_store_app/Services/BookRemoteServices.dart';
import 'package:book_store_app/Widget/BookItemCard.dart';
import 'package:flutter/material.dart';

class Bookhomescreen extends StatefulWidget {

  const Bookhomescreen({super.key});

  @override
  State<Bookhomescreen> createState() => BookHomeScreenState();
}

class BookHomeScreenState extends State<Bookhomescreen> {
  List<Book> allBooks = [];
  bool isLoaded = false;
  

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allBooks= (await Bookremoteservices().getAllBooks())!;
    if(allBooks.isNotEmpty){
      setState(() {
        isLoaded=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Store")),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BookAddScreen()));
      },
      child: Icon(Icons.add),),
      body: Visibility(
        visible:isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: allBooks.length,
          itemBuilder: (context, index) => BookItemCard(book: allBooks[index],),
        ),
      ),
    );
  }
}

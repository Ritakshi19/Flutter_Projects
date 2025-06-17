import 'dart:convert';

import 'package:book_store_app/Models/Book.dart';
import 'package:http/http.dart' as http;

class Bookremoteservices {
Future<List<Book>?> getAllBooks() async{
var httpClient =  http.Client();
var url= Uri.parse('http://64.227.179.213:3000/books');
var response=await  httpClient.get(url);
if(response.statusCode == 200){
  var jsonData =response.body;
  return bookListfromJson(jsonData);
}
}

Future<bool> addBook(Book book) async{
  var httpClient =  http.Client();
var url= Uri.parse('http://64.227.179.213:3000/addbook');
var response=  await httpClient.post(url,headers: {'Content-Type':'application/json'},body: json.encode(book.toJson()));
if(response.statusCode==201){
  return true;
}
return false;
}

Future<Book?> getBookById(int id) async{
  var httpClient =  http.Client();
  var url= Uri.parse('http://64.227.179.213:3000/books/$id');
  var response = await httpClient.get(url);
  if(response.statusCode==200){
    final jsonBookData = json.decode(response.body);
    return Book.fromJson(jsonBookData);
  }
  else{
    return null;
  }

}

Future<bool> updateBook(Book book) async{
  var httpClient =  http.Client();
  var url= Uri.parse('http://64.227.179.213:3000/updatebook/${book.id}');
  var response = await httpClient.put(url,headers: {'Content-Type':'application/json'},body: json.encode(book.toJson()));
  if(response.statusCode==200 || response.statusCode==200 ){
    return true;
  }
  return false;
}

Future<bool> deleteBook(int id) async{
  var httpClient =  http.Client();
  var url= Uri.parse('http://64.227.179.213:3000/deletebook/$id');
  var response = await httpClient.delete(url);
  if(response.statusCode==204){
    return true;
  }
  return false;

}
}
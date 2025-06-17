import 'package:networkingdemo/Model/Photos.dart';
import 'package:http/http.dart' as http;

class Photoremoteservices {

    Future <List<Photos>?> getAllPhotos() async{
  var client = http.Client();
  var url=Uri.parse("https://jsonplaceholder.typicode.com/photos");
  var response = await client.get(url);
  if(response.statusCode==200){
    var jsonData=response.body;
    return photosListFromJson(jsonData);
  }

    

    }


}
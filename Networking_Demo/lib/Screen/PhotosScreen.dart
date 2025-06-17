import 'package:flutter/material.dart';
import 'package:networkingdemo/Model/Photos.dart';
import 'package:networkingdemo/Services/PhotoRemoteServices.dart';
import 'package:networkingdemo/widgets/PhotosCard.dart';

class Photosscreen extends StatefulWidget{
  @override
  State<Photosscreen> createState() => _PhotosscreenState();
}

class _PhotosscreenState extends State<Photosscreen> {
  
    List<Photos>? allPhotos=[];
    bool isLoaded = false;
    @override
    void initState(){
      super.initState();
      getPhotos();
    }

    void getPhotos() async{
      allPhotos = await Photoremoteservices().getAllPhotos();
      if(allPhotos!= null){
        setState(() {
          isLoaded=true;
        });
      }
    }
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photos"),),
      body:Visibility(
        visible:isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: allPhotos!.length,
          itemBuilder: (context, index)=> PhotosCard(photos: allPhotos![index],))));
  }

}
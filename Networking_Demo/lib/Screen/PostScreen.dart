import 'package:flutter/material.dart';
import 'package:networkingdemo/Model/Post.dart';
import 'package:networkingdemo/Services/PostRemoteServices.dart';
import 'package:networkingdemo/widgets/PostCard.dart';

class Postscreen extends StatefulWidget {
  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  List<Post>? allPost=[];
  bool isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }

  void getData() async{
    allPost= await Postremoteservices().getAllPosts();
    if(allPost!= null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: allPost!.length,
          itemBuilder: (context, index) => PostCard(post: allPost![index]),
        ),
      ),
    );
  }
}

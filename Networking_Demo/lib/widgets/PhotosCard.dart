import 'package:flutter/material.dart';
import 'package:networkingdemo/Model/Photos.dart';

class PhotosCard extends StatelessWidget {
  final Photos photos;

   PhotosCard({Key? key, required this.photos}) : super(key: key);

    
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      color: const Color.fromARGB(255, 236, 83, 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              photos.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            const SizedBox(height: 8),
            Image.network(photos.url, ),
            const Divider(height: 20),
            Image.network(photos.thumbnailUrl,),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Post ID: ${photos.id}", style: TextStyle(color: Colors.white),),
                 ],
            ),
          ],
        ),
      ),
    );
  }
  
}

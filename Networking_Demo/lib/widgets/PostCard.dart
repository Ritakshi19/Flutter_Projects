import 'package:flutter/material.dart';
import 'package:networkingdemo/Model/Post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

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
              post.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(post.body, style: const TextStyle(fontSize: 16,color: Colors.white)),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Post ID: ${post.id}", style: TextStyle(color: Colors.white),),
                Text("User ID: ${post.userId}",style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
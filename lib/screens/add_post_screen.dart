import 'package:fame_nadz/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    // return Center(
    //   child: IconButton(
    //     icon: const Icon(Icons.arrow_back),
    //     onPressed: () {},
    //   ),
    // );
    return Scaffold(
    appBar: AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {  },),
      title: const Text("Post To"),
      centerTitle :false,
     actions:[
        TextButton(
    //     onPressed: () => postImage(
    //   userProvider.getUser.uid,
    //   userProvider.getUser.username,
    //   userProvider.getUser.photoUrl,
    // ),
    onPressed: (){},
    child: const Text(
    "Post",
    style: TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 16.0),
    ),
    ),]
    ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://unsplash.com/photos/a-large-body-of-water-under-a-cloudy-sky-G9i_plbfDgk"
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}

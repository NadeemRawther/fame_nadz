import 'package:fame_nadz/screens/add_post_screen.dart';
import 'package:fame_nadz/screens/feed_screen.dart';
import 'package:fame_nadz/screens/profile_screen.dart';
import 'package:fame_nadz/screens/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];